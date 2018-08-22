package osebuild.app.oscam;

import android.Manifest;
import android.annotation.SuppressLint;
import android.app.Service;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Environment;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.PowerManager;
import android.os.SystemClock;
import android.util.Log;
import android.widget.Toast;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

public class CamService extends Service {

    private Boolean serviceRunning = false;
    private int run = 0;
    private PowerManager.WakeLock wakeLock;

    @SuppressLint("WakelockTimeout")
    private void running() {
        if (!serviceRunning) {
            File conf;
            if (write_storage() && read_storage())
                conf = new File(Environment.getExternalStorageDirectory().getAbsolutePath() + "/OSEbuild/OSCam");
            else conf = this.getFilesDir();
            final File cam = new File(this.getFilesDir().getParent() + "/oscam");
            final File tmp = new File(conf + "/tmp");
            if (!tmp.exists() && tmp.mkdirs())
                Log.d("Mkdir", String.valueOf(tmp));
            serviceRunning = true;
            try {
                Runtime.getRuntime().exec("killall -9 oscam");
            } catch (Exception e) {
                e.printStackTrace();
            }
            conf_file(conf + "/oscam.conf", "\n" +
                    "[global]\n" +
                    "disablelog                    = 1\n" +
                    "logfile                       = stdout\n" +
                    //"logfile                       = " + tmp + "oscam.log");
                    "nice                          = -1\n" +
                    "usrfile                       = " + tmp + "/oscamuser.log\n" +
                    "lb_mode                       = 1\n" +
                    "lb_min_ecmcount               = 2\n" +
                    "lb_stat_cleanup               = 24\n" +
                    "lb_max_readers                = 1\n" +
                    "lb_savepath                   = " + tmp + "/stat\n" +
                    /*"\n[dvbapi]\n" +
                    "enabled                       = 1\n" +
                    "au                            = 1\n" +
                    "pmt_mode                      = 0\n" +
                    "delayer                       = 60\n" +
                    "user                          = dvbapi\n" +*/
                    "\n[webif]\n" +
                    "httpport                      = 8888\n" +
                    "httpallowed                   = 127.0.0.1,192.168.0.1-192.168.255.255\n");
            conf_file(conf + "/oscam.server", "\n" +
                    "[reader]\n" +
                    "label                         = internal\n" +
                    "enable                        = 0\n" +
                    "protocol                      = internal\n" +
                    "device                        = /dev/sci0\n" +
                    "detect                        = cd\n" +
                    "group                         = 1\n" +
                    "\n[reader]\n" +
                    "label                         = mouse\n" +
                    "enable                        = 0\n" +
                    "protocol                      = mouse\n" +
                    "device                        = /dev/ttyUSB0\n" +
                    "detect                        = cd\n" +
                    "group                         = 1\n");
            conf_file(conf + "/oscam.user", "\n" +
                    "[account]\n" +
                    "disabled                      = 1\n" +
                    "user                          = dvbapi\n" +
                    "group                         = 1\n");
            conf_file(tmp + "/stat", "");
            if (!cam.exists()) {
                try {
                    InputStream is = getAssets().open("oscam");
                    FileOutputStream fos = new FileOutputStream(cam);
                    byte[] buffer = new byte[is.available()];
                    int bytesRead;
                    while ((bytesRead = is.read(buffer)) > 0)
                        fos.write(buffer, 0, bytesRead);
                    fos.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                if (cam.setExecutable(true, false))
                    Log.d("Executable", String.valueOf(cam));
                Log.d("OSCam", "installing!");
            }
            if (cam.exists()) {
                SystemClock.sleep(200);
                new Thread(() -> {
                    try {
                        Process process = Runtime.getRuntime().exec(cam + " -c " + conf + " -t " + tmp);
                        process.waitFor();
                        serviceRunning = false;
                        if (run < 5) {
                            run++;
                            Thread.sleep(4000);
                            running();
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }).start();
            } else serviceRunning = false;
            SystemClock.sleep(1000);
            if (serviceRunning) {
                if (wake_lock()) {
                    PowerManager powerManager = (PowerManager) getSystemService(Service.POWER_SERVICE);
                    if (powerManager != null) {
                        wakeLock = powerManager.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, "MyWakelockTag");
                        wakeLock.acquire();
                    }
                }
                run = 0;
                toast("OSCam started!");
            } else {
                if (wake_lock() && wakeLock != null) wakeLock.release();
                toast("OSCam ERROR!");
            }
        } else {
            run = 0;
            toast("OSCam in progress");
        }
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        running();
        super.onStartCommand(intent, flags, startId);
        return START_STICKY;
    }

    private void conf_file(String file, String string) {
        File file_conf = new File(file);
        if (!file_conf.exists()) {
            try {
                FileOutputStream f = new FileOutputStream(file);
                PrintWriter pw = new PrintWriter(f);
                pw.println(string);
                pw.flush();
                pw.close();
                f.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private boolean write_storage() {
        int result = this.checkCallingOrSelfPermission(Manifest.permission.WRITE_EXTERNAL_STORAGE);
        return result == PackageManager.PERMISSION_GRANTED;
    }

    private boolean read_storage() {
        int result = this.checkCallingOrSelfPermission(Manifest.permission.READ_EXTERNAL_STORAGE);
        return result == PackageManager.PERMISSION_GRANTED;
    }

    private boolean wake_lock() {
        int result = this.checkCallingOrSelfPermission(Manifest.permission.WAKE_LOCK);
        return result == PackageManager.PERMISSION_GRANTED;
    }

    private void toast(final String text) {
        Handler handler = new Handler(Looper.getMainLooper());
        handler.post(() -> Toast.makeText(this, text, Toast.LENGTH_LONG).show());
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
    }

    @Override
    public IBinder onBind(Intent arg0) {
        return null;
    }
}

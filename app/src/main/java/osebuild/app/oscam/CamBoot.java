package osebuild.app.oscam;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public class CamBoot extends BroadcastReceiver {
    public void onReceive(Context context, Intent intent) {
        if ("android.intent.action.BOOT_COMPLETED".equals(intent.getAction()) || "android.intent.action.QUICKBOOT_POWERON".equals(intent.getAction())) {
            Intent service = new Intent(context, CamService.class);
            context.startService(service);
        }
    }
}

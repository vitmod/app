package osebuild.app.oscam;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

public class CamActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        startService(new Intent(getBaseContext(), CamService.class));
        finish();
    }
}

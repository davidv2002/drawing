/**
 i do not know how this next bit works, i found it on the  Processing Forum and it works
 what it does is hide the menu bar in android. do not ask me how it does that
 */

import android.os.Bundle; 
import android.view.WindowManager;
import android.view.*;

void onCreate(Bundle bundle) { 
  super.onCreate(bundle);
  View decorView = getActivity().getWindow().getDecorView();
  decorView.setSystemUiVisibility(0);
  int uiOptions = View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
    | View.SYSTEM_UI_FLAG_FULLSCREEN;
  decorView.setSystemUiVisibility(uiOptions);
}

// end of bit that i do not know about

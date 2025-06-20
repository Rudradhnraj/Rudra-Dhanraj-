require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "AndLua"
import "android.graphics.Typeface"
import "http"
import "android.content.Context"
import "android.content.Intent"
import "android.provider.Settings"
import "android.net.Uri"
import "android.content.pm.PackageManager"
import "android.media.MediaPlayer"
import "android.animation.ObjectAnimator"
import "zip4j"
import "java.io.File"
import "android.content.*"
import "android.net.*"
import "android.graphics.drawable.BitmapDrawable"
import "android.media.MediaPlayer"
import "android.speech.tts.TextToSpeech"
import "Hi"


activity.setTheme(R.AndLua1)
activity.actionBar.hide()
activity.setContentView(loadlayout(Hi))
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS)
activity.overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out)


function CircleButtonZ(view,InsideColor,radiu,InsideColor1)
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  drawable.setCornerRadii({radiu, radiu, radiu, radiu, radiu, radiu, radiu, radiu})
  drawable.setColor(InsideColor)
  drawable.setStroke(3, InsideColor1)
  view.setBackgroundDrawable(drawable)
end


CircleButtonZ(btnRegister,0x45000000,25,0xFFFF0000)
CircleButtonZ(card,0x29000000,20,0xFF0000FF)
CircleButtonZ(txtUsername,0x45000000,10,0xFF00FF00)
CircleButtonZ(txtPassword,0x45000000,10,0xFF00FF00)
CircleButtonZ(txtUUID,0x45000000,10,0xFF00FF00)
CircleButtonZ(txtexpire,0x45000000,10,0xFF00FF00)
CircleButtonZ(txtPRICE,0x45000000,10,0xFF00FF00)
CircleButtonZ(btnDelete,0x45000000,25,0xFFFF0000)
CircleButtonZ(card2,0x29000000,20,0xFF0000FF)
CircleButtonZ(txtUsername3,0x45000000,10,0xFF00FF00)



function Waterdropanimation(Controls,time)
  import "android.animation.ObjectAnimator"
  ObjectAnimator().ofFloat(Controls,"scaleX",{1,.8,1.3,.9,1}).setDuration(time).start()
  ObjectAnimator().ofFloat(Controls,"scaleY",{1,.8,1.3,.9,1}).setDuration(time).start()
end


import "android.graphics.Paint"

title.setTypeface(Typeface.DEFAULT_BOLD)
btnRegister.setTypeface(Typeface.DEFAULT_BOLD)
title1.setTypeface(Typeface.DEFAULT_BOLD)
title2.setTypeface(Typeface.DEFAULT_BOLD)
title3.setTypeface(Typeface.DEFAULT_BOLD)
title4.setTypeface(Typeface.DEFAULT_BOLD)
title5.setTypeface(Typeface.DEFAULT_BOLD)
title7.setTypeface(Typeface.DEFAULT_BOLD)
btnDelete.setTypeface(Typeface.DEFAULT_BOLD)




import "android.provider.Settings$Secure"
uuid = Secure.getString(activity.getContentResolver(), Secure.ANDROID_ID)


function btnRegister.onClick()
  local user = txtUsername.text
  local pass = txtPassword.text
  local uuid = txtUUID.text
  local price = txtPRICE.text
  local expire = txtexpire.text

  Waterdropanimation(btnRegister,210)
  btnRegister.setText("C h e c k i n g !")

  Http.post("https://pyoid-chimney.000webhostapp.com/register.php","&username="..user.."&password="..pass.."&uuid="..uuid.."&expire="..expire.."&price="..price,nil,"utf8",nil,function(code,body,cookie,header)
    if code == 200 then
      MD提示((body),"#2196F3","#ffffffff","4","10")
      btnRegister.setText("R E G I S T E R")
     else
      MD提示("Can't connect to server!","#2196F3","#ffffffff","4","10")
      btnRegister.setText("R E G I S T E R")
    end
  end);
end




function btnDelete.onClick()
  Waterdropanimation(btnDelete,210)
  local user = txtUsername3.text
  btnDelete.setText("C h e c k i n g !")
  Http.post("https://pyoid-chimney.000webhostapp.com/delete.php","&username="..user,nil,"utf8",nil,function(code,body,cookie,header)
    if code == 200 then
      MD提示((body),"#2196F3","#ffffffff","4","10")
      btnDelete.setText("D E L E T E")
     else
      MD提示("Can't connect to server!","#2196F3","#ffffffff","4","10")
      btnDelete.setText("D E L E T E")
    end
  end);
end

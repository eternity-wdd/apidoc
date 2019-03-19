/**
 * 
 */
$().ready(function() {
// 在键盘按下并释放及提交后验证提交表单
  $("#commentForm").validate({
    rules: {
      username: {
        required: true,
        minlength: 2
      },
      mobile: {
        required: true,
      },
    },
    messages: {
      username: {
        required: "请输入用户名",
        minlength: "用户名必需由两个字母组成"
      },
      mobile: {
        required: "请输入手机号",
        minlength: "手机号11位"
      },
    }
  });
});
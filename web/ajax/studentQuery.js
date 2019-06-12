//获取数据
function getBuild() {
    //获取用户请求信息
    /*获取下拉列表信息*/
    var query=document.getElementById("sel");
    alert(query.value);
    var queBuild="place="+query.value;


    //创建ajax引擎对象
    var ajax;
    if (window.XMLHttpRequest){
        ajax=new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        ajax=new ActiveXObject("Msxml2.XMLHTTP");
    }
    //复写onreadystatachange函数
    ajax.onreadystatechange=function () {
        if (ajax.readyState==4) {
            /*alert(ajax.status);*/
            //判断响应状态码
            if(ajax.status==200){
                //获取响应数据
                var result=ajax.responseText;//处理结果
                eval("var select="+result);//eval() 函数可计算某个字符串，并执行其中的的 JavaScript 代码。
                alert(result);

                //处理响应数据
                //获取表格对象
                // var ta=document.getElementById("ta");
                // ta.innerHTML="";
                // //插入新的行
                // var tr=[];
                // tr[0]=ta.insertRow(0);
                // var str0=["学号","姓名","密码","班级","电话","QQ号","状态","类型"];
                // var cell=[];
                // for (var i=0;i<str0.length;i++){
                //     cell[i]=tr[0].insertCell(i);
                //     cell[i].innerHTML=str0[i];
                //     cell[i].style.textAlign="center";
                //     cell[i].style.width="100px";
                //     cell[i].style.backgroundColor="green";
                // }
                // /*alert("str="+str0)*/
                // for (var n=0;n<students.length;n++){
                //     tr[n+1]=ta.insertRow(n+1);
                //     var str1=null;
                //     str1=[students[n].sno,students[n].username,students[n].password,students[n].cno,students[n].phone,students[n].qq,students[n].status,students[n].type];
                //     //alert("n="+n);
                //     var cell=[];
                //     for (var i=0;i<str1.length;i++){
                //         //alert("i="+i);
                //         cell[i]=tr[n+1].insertCell(i);
                //         cell[i].innerHTML=str1[i];
                //     }
                // }
            }
        }
    }
    //发送请求
    ajax.open("get","/QueryServlet?"+queBuild,true);

    ajax.send(null);
}


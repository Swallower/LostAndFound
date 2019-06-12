function getData() {
    //获取用户请求信息
    /*获取下拉列表信息*/
    var place=document.getElementById("place").value;
    var queDate="place="+place;
    /*用户输入的信息*/
    // var inp=document.getElementById("inp").value;
    // var inpDate="inp="+inp;
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

            if(ajax.status==200){
                //获取响应数据
                var result=ajax.responseText;
                eval("var place="+result);//eval() 函数可计算某个字符串，并执行其中的的 JavaScript 代码。
                /*eval("var obj="+result);*/
                //alert(result);
                //alert(students);
                //alert("students.length="+students.length);
                //处理响应数据
                //获取表格对象
                var ta=document.getElementById("b1");
                ta.innerHTML="";
                //插入新的行
                var tr=[];
                tr[0]=ta.insertRow(0);
                var str0=["序号","名称","描述","类型","图片","地点","丢失时间","更新时间","联系"];
                var cell=[];
                for (var i=0;i<str0.length;i++){
                    cell[i]=tr[0].insertCell(i);
                    cell[i].innerHTML=str0[i];
                    cell[i].style.textAlign="center";
                    cell[i].style.width="100px";
                    cell[i].style.backgroundColor="green";
                }
                /*alert("str="+str0)*/
                for (var n=0;n<lost.length;n++){
                    tr[n+1]=ta.insertRow(n+1);
                    var str1=null;
                    str1=[lost[n].id,lost[n].title,lost[n].type,lost[n].content,lost[n].img,lost[n].losttime,lost[n].updatetime,lost[n].place];
                    //alert("n="+n);
                    var cell=[];
                    for (var i=0;i<str1.length;i++){
                        //alert("i="+i);
                        cell[i]=tr[n+1].insertCell(i);
                        cell[i].innerHTML=str1[i];
                    }
                }
            }
        }
    }
    //发送请求
    // ajax.open("get","/QueryStudentServlet?"+placeDate+"&"+inpDate,true);
    ajax.send(null);
}
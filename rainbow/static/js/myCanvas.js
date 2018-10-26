//x,y 坐标,radius 半径,process 百分比,backColor 中心颜色, proColor 进度颜色, fontColor 中心文字颜色
function DrowProcess(x,y,radius,process,backColor,proColor,fontColor){
    var canvas = document.getElementById('myCanvas');

    if (canvas.getContext) {
        var cts = canvas.getContext('2d');
    }else{
        return;
    }

    cts.beginPath();
    // 坐标移动到圆心
    cts.moveTo(x, y);
    // 画圆,圆心是24,24,半径24,从角度0开始,画到2PI结束,最后一个参数是方向顺时针还是逆时针
    cts.arc(x, y, radius, 0, Math.PI * 2, false);
    cts.closePath();
    // 填充颜色
    cts.fillStyle = backColor;
    cts.fill();

    cts.beginPath();
    // 画扇形的时候这步很重要,画笔不在圆心画出来的不是扇形
    cts.moveTo(x, y);
    // 跟上面的圆唯一的区别在这里,不画满圆,画个扇形
    cts.arc(x, y, radius, Math.PI * 1.5, Math.PI * 1.5 -  Math.PI * 2 * process / 100, true);
    cts.closePath();
    cts.fillStyle = proColor;
    cts.fill();

    //填充背景白色
    cts.beginPath();
    cts.moveTo(x, y);
    //填充的背景色宽度
    cts.arc(x, y, radius - (radius * 0.19), 0, Math.PI * 2, true);
    cts.closePath();
    cts.fillStyle = 'rgba(255,255,255,1)';
    cts.fill();

    // 画一条线
    cts.beginPath();
    cts.arc(x, y, radius-(radius*0.19), 0, Math.PI * 2, true);
    cts.closePath();
    // 与画实心圆的区别,fill是填充,stroke是画线
    cts.strokeStyle = backColor;
    cts.stroke();

    //在中间写字
    cts.font = "bold 11pt Arial";
    cts.fillStyle = fontColor;
    cts.textAlign = 'center';
    cts.textBaseline = 'middle';
    cts.moveTo(x, y);
    cts.fillText(process+"%", x, y);

}
bfb = 0;
time=0;
function Start(){
    DrowProcess(35,35,32,bfb,'#ddd','#ff8a5c','#ff8a5c');
   // DrowProcess(180,60,55,bfb,'#ddd','#e74c3c','#e74c3c');
    //DrowProcess(300,60,55,bfb,'#ddd','#FF7F50','#FF7F50');

    t = setTimeout(Start,5);
    var pernum = Math.floor(Math.random()*10+91);
    if(pernum<95){
        pernum = pernum + 4;
    }
    if(bfb>=pernum){
        clearTimeout(t);
        bfb=0;
        return;
    }
    bfb+=1;
}

/*function Create(){

	DrowProcess(420,60,55,25,'#ddd','#32CD32','#32CD32');
}*/

Start();
//Create();
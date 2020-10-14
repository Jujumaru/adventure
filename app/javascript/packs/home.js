<%= javascript_pack_tag 'home' %>

var c = document.getElementById('canvas'); 
console.log(c);       
    ctx = c.getContext('2d'),
    cw = c.width;
    ch = c.height;

for( var x = 0; x < cw; x++ ){
    for( var y = 0; y < ch; y++ ){
        ctx.fillStyle = 'hsl(0, 0%, ' + ( 100 - ( Math.random() * 15 ) ) + '%)';
        ctx.fillRect(x, y, 1, 1);
    }
}

document.body.style.background = 'url(' + c.toDataURL() + ')';
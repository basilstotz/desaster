#!/bin/sh


names="apfel birne citrone dattel emmer feige gerste hirse idared kirsche limone"

cat <<EOF > dashboard.html
<!DOCTYPE html>
<html>
<head>
    <title>Desastre</title>
</head>
<body>
<h1>Desaster Dashboard</h1>
EOF

for n in $names; do
  mkdir -p $n
  cp template/* $n
  qrencode -lH -s5 -o $n/qrcode.png "https://desaster.arglos.ch/slides/$n/index.html"

  cat <<EOF > $n/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Desastre</title>
</head>

<body>
  <h1>$n</h1>
  <img src="qrcode.png"><br/>
  <a href="capture.html">Capture</a><br/>
  <a href="view.html">View</a><br/>
</body>
</html>
EOF
  
  echo "<div><a href=\"$n/index.html\">$n</a><br/><img id=\"$n\" src=\"$n/slide.jpg\" width=\"25%\"></div>" >> dashboard.html
done

cat <<EOF >> dashboard.html
<script>
function updateSlide(id){document.getElementById(id).src = id+'/slide.jpg?r='+Math.random()}

function update(){
EOF

for n in $names; do
    echo "   updateSlide(\"$n\");" >> dashboard.html
done


cat <<EOF >> dashboard.html
}
setInterval(update, 5000);
</script>
</body>
</html>
EOF

        
        

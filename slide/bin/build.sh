#!/bin/sh

prefix="./dist"

names="apfel birne citrone dattel emmer feige gerste hirse idared kirsche limone"
test -d $prefix && rm -r $prefix
mkdir -p $prefix

cat <<EOF > $prefix/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Desastre</title>
</head>
<body>
</body>
</html>
EOF

for n in $names; do
    test -d $prefix/$n && rm -r $prefix/$n
done

cat <<EOF > $prefix/dashboard.html
<!DOCTYPE html>
<html>
<head>
    <title>Desastre</title>
</head>
<body>
<h1>Desaster Dashboard</h1>
EOF

for n in $names; do
  mkdir -p $prefix/$n
  cp template/* $prefix/$n
  qrencode -lH -s5 -o $prefix/$n/qrcode.png "https://desaster.arglos.ch/slides/$n/index.html"

  cat <<EOF > $prefix/$n/index.html
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
  
  echo "<div><a href=\"$n/index.html\">$n</a><br/><img id=\"$n\" src=\"$n/slide.jpg\" width=\"25%\"></div>" >> $prefix/dashboard.html
done

cat <<EOF >> $prefix/dashboard.html
<script>
function updateSlide(id){document.getElementById(id).src = id+'/slide.jpg?r='+Math.random()}

function update(){
EOF

for n in $names; do
    echo "   updateSlide(\"$n\");" >> $prefix/dashboard.html
done


cat <<EOF >> $prefix/dashboard.html
}
setInterval(update, 5000);
</script>
</body>
</html>
EOF

        
        

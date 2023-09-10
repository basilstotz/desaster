#!/bin/sh

prefix="./dist"

names="apfel birne citrone dattel emmer feige gerste hirse idared kirsche limone"
test -d $prefix && rm -r $prefix
mkdir -p $prefix

# dummy placeholder index.html
cat <<EOF > $prefix/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Desastre</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="width=device-width" />
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
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="width=device-width" />
        <style>
           .slide { display:inline }
        </style>
</head>
<body>
<h1>Desaster Dashboard</h1>
EOF

for n in $names; do
  mkdir -p $prefix/$n
  cp template/* $prefix/$n
  if ! test -f ./qrcode/$n.png; then
      qrencode -lH -s5 -o ./qrcode/$n.png "https://desaster.arglos.ch/slides/$n/index.html"
  fi
  cp ./qrcode/$n.png $prefix/$n/qrcode.png
  
  cat <<EOF > $prefix/$n/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Desastre</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="width=device-width" />
</head>

<body>
  <h1>Desaster $n</h1>
  <p>Scanne diesen QR-Code mit den Handy, um diese Seite mit dem Handy zu öffnen:<p>
  <img src="qrcode.png"><br/>
  <p>(Alternatif kannst du diese URL <em>https://desaster.arglos.ch/slides/$n/index.html</em> auch händisch auf den Handy eingeben)</p> 
  <h3>Aufnehmen</h3>
  <p>Öffne diesen Link um die Aufnahme zu starten: <a href="capture.html">Capture</a>.</p><p>(Achtung: Du solltest dies nur einmal aktiv haben, sonst gibt ein (harmloses) Durcheinander.<p/>
  <h3>Ansehen</h3>
  <p>Mit diesem Link kannst du deine Aufnahme ansehen: <a href="view.html">View</a>.</p><p>(Du kannst diesen Link so oft wie du willst öffnen.)</p>
</body>
</html>
EOF
  
  echo "<div class=\"slide\" ><a href=\"$n/index.html\">$n</a><br/><img id=\"$n\" src=\"$n/slide.jpg\" width=\"25%\"></div>" >> $prefix/dashboard.html
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


#!/bin/sh


test -d stream && rm -r stream
test -d view && rm -r view

view="view"

mkdir -p $view

    cat<<EOF >$view/index.html
<html lang="de">

<head>
  <meta charset="utf-8">
  <meta http-equiv="content-type" content="text/html;charset=utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
</head>

<body>
EOF

for i in $(seq 0 12); do
    room=$(date +%N|md5sum|cut -d\  -f1)
    name=$(printf "%03i" $i)
    dir=stream/$name-$room

    stream="https://desaster.arglos.ch/stream.html?mute=false&displayName=$name&roomName=$room"
    monitor="https://desaster.arglos.ch/stream.html?mute=true&displayName=$name&roomName=$room"

    mkdir -p $dir

    cat<<EOF >>$view/index.html
<p>
  <b>$name:&nbsp;&nbsp;&nbsp;&nbsp;</b>
  <a href="https://desaster.arglos.ch/$dir/stream.html">Stream</a>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <a href="https://desaster.arglos.ch/$dir/monitor.html">Monitor</a>
</p>
EOF

    cat<<EOF >$dir/index.html
<html lang="de">

<head>
  <meta charset="utf-8">
  <meta http-equiv="content-type" content="text/html;charset=utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
</head>

<body>
  <a href="$stream">Stream</a>
  <a href="$monitor">Monitor</a>
</body>
</html>
EOF

    cat<<EOF >$dir/stream.html
<html>
  <head>
    <meta http-equiv="refresh" content="0; URL=$stream">
  </head>
  <body>
  </body>
</html>
EOF

    cat<<EOF >$dir/monitor.html
<html>
  <head>
    <meta http-equiv="refresh" content="0; URL=$monitor">
  </head>
  <body>
  </body>
</html>
EOF

done

    cat<<EOF >>$view/index.html
</body>
</html>
EOF

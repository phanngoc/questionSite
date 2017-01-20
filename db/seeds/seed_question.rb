$i = 1
$num = 10

while $i <= $num  do
  strRan1 = (0...8).map { (65 + rand(26)).chr }.join
  strRan2 = ('a'..'z').to_a.shuffle[0,8].join
  name = "phan " + strRan1
  email = "email_" + strRan1 + "@gmail.com"
  username = "username_" + strRan2
  password = "pass_" + strRan2
  avatar = "nopic_192.gif"
  Question.create(title: title, content: content,
              user_id: username, password: password,
              avatar: avatar )

   $i +=1
end

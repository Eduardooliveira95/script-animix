#!/bin/bash
    sleep 3
echo "Bem vindo ao Intalador do Animix :)"
    sleep 3
echo "Vamos começar ?"
    sleep 5
echo "Primeiro, vamos fazer algumas atualizações..."
sudo apt update && sudo apt update

echo "Gostaria de instalar uma interface gráfica ? (s/n)"
read inst
if [ \"$inst\" == \"s\" ];
then
sudo apt-get install xrdp lxde-core lxde tigervnc-standalone-server -y
else 
    sleep 5
echo "Certo, vamos continuar!"
fi

# echo "Agora, vamos instalar sua interface gráfica!"
# sudo apt-get install xrdp lxde-core lxde tigervnc-standalone-server -y

    sleep 3
echo "Vamos fazer a instalação do container!"

sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo docker pull mysql:5.7
sudo docker run -d -p 3306:3306 --name AnimixDocker -e "MYSQL_DATABASE=Animix" -e "MYSQL_ROOT_PASSWORD=urubu100" mysql:5.7
docker exec -it AnimixDocker bash mysql -u root -p -B -N -e "
    
    use Animix;

    CREATE TABLE studio(
        idStudio int primary key auto_increment not null,
        nomeEmpresa varchar(45),
        email varchar(45),
        senha varchar(45),
        logradouro varchar(45),
        telefone varchar(45),
        CNPJ varchar(45),
);

    CREATE TABLE maquinas(
        idMaquina int primary key auto_increment,
        fkStudio int,
        disco varchar(100),
        discoIdeal decimal(5, 2),
        memoria varchar(100),
        memoriaIdeal decimal(5, 2),
        processador varchar(100),
        processamentoIdeal decimal(5, 2),
        sistema varchar(100),
        monitoraDisco bool,
        monitoraMemoria bool,
        monitoraProcessador bool,
        monitoraTemperatura bool,
        quantidadeDiscos int,
    );

    CREATE TABLE dados(
        idDado int primary key auto_increment not ,
        fkMaquina int,
        usoCPU decimal(10,2),
        UsoMemoria decimal(5,2),
        temperatura decimal(5,2),
        porcentDisco decimal(5,2),
        qtdProcessos int,
        qtdServicos int,
        dataColeta varchar(45),
        momento time(7),
        isCritico bool,
        comment varchar(200)
    );
"
java -version
if [ $? -eq 0 ];
then
echo "java instalado"
cd /ScriptShell
git clone https://github.com/alecostx/animix-data-collection.git
else
echo "java nao instalado"
echo "gostaria de instalar o java? (s/n)"
read inst
if [ \"$inst\" == \"s\" ];
then
sudo apt install default-jre -y
cd /ScriptShell
git clone https://github.com/alecostx/animix-data-collection.git
fi
fi
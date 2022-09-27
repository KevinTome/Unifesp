///Universidade Federal de São Paulo - SJC
///Kevin Lourenço Tomé - 135065
///Computação gráfica - 2/2021
///Projeto Final

#include <windows.h>
#include <stdio.h>
#include<string.h>
#include <GL/glut.h>
#include <math.h>
#define PI=3.14159265358979323846;
///--------------------Inicializar funções
void keyboard(unsigned char , int , int );
void update(int);
void desenha_circulo(float x, float y, float radius);
///--------------------Inicializar variáveis
float moveCarro01 = 0.0f;
float moveCarro02 = 800.0f;
float move_nuvem=0;
float move_poeira=0;
float aceleraBus=0.0f;
float posCarro01=0;
float posCarro02=0;
bool chuva = false;
float _chuva= 0.0f;
void noite(int);
void dia();
void anoitecer();
void desenhaCarro01();
void desenhaCarroNoite();
void desenhaBdCarro01();
void desenhaCarro02();
void desenhaBdCarro02();
void carroBdNoite();
///-------------------- Rua
void desenhaRua(){
    glBegin(GL_POLYGON);
    glColor3f(0.2,0.2,0.2);
    glVertex2i(0,200);
    glVertex2i(800,200);
    glVertex2i(800,400);
    glVertex2i(0,400);
    glEnd();

    glBegin(GL_POLYGON);
    glColor3ub(153, 102, 51);
    glVertex2i(0,380);
    glVertex2i(800,380);
    glVertex2i(800,405);
    glVertex2i(0,405);
    glEnd();
    glBegin(GL_POLYGON);
    glColor3ub(100, 100, 30);
    glVertex2i(0,200);
    glVertex2i(800,200);
    glVertex2i(800,220);
    glVertex2i(0,220);
    glEnd();
    ///---------- Parte de cima da rua
    glBegin(GL_LINES);
    glLineWidth(5);
	glColor3ub(223, 191, 159);
    glVertex2i(0,380);
    glVertex2i(800,380);
    glEnd();
    ///---------- Parte de baixo da rua
    glBegin(GL_LINES);
    glLineWidth(5);
	glColor3f(1.0,1.0,1.0);
    glVertex2i(0,220);
    glVertex2i(800,220);
    glEnd();
    ///---------- Divisor
    glBegin(GL_LINES);
    glColor3f(1.0,1.0,0.0);     ///amarelo
    int dividerLine=0;
    for(int i=0;i<20;i++){
        glVertex2i(dividerLine+20,300);
        glVertex2i(dividerLine+40,300);
        dividerLine=dividerLine+40;
    }
    glEnd();
    ///---------- Sombra da calçada de baixo
    int changeX1=0,changeX2=40;
    for(int i=0;i<20;i++){
        glBegin(GL_POLYGON);
        if(i%2==0){
            glColor3ub(170, 153, 0);    ///amarelo dourado
        }else{
            glColor3ub(217, 217, 217);  ///branco
        }
        glVertex2i(changeX1,180);
        glVertex2i(changeX2,180);
        glVertex2i(changeX2,210);
        glVertex2i(changeX1,210);
        changeX1=changeX2;
        changeX2=changeX2+40;
        glEnd();
    }
    ///---------- Calçada de baixo
    glBegin(GL_LINES);
    glLineWidth(5);
	glColor3f(204, 153, 0);     ///amarelo dourado
    glVertex2i(0,210);
    glVertex2i(800,210);
    glEnd();
    ///---------- Sombra da calçada de cima
    int TopChangeX1=0,TopchangeX2=40;
    for(int i=0;i<20;i++){
        glBegin(GL_POLYGON);
        if(i%2==1){
            glColor3ub(170, 153, 0);    ///amarelo
        }else{
            glColor3ub(217, 217, 217);  ///branco
        }
        glVertex2i(TopChangeX1,400);
        glVertex2i(TopchangeX2,400);
        glVertex2i(TopchangeX2,420);
        glVertex2i(TopChangeX1,420);
        TopChangeX1=TopchangeX2;
        TopchangeX2=TopchangeX2+40;
        glEnd();
    }
    ///---------- Calçada de cima
    glBegin(GL_LINES);
    glLineWidth(5);
	glColor3f(204, 153, 0);     //amarelo
    glVertex2i(0,420);
    glVertex2i(800, 420);
    glEnd();
}
void desenhaGramado(){
    ///---------- Gramado
    glBegin(GL_POLYGON);
	glColor3f(0,0.60,0);     ///verde
    glVertex2i(0,0);
    glVertex2i(800, 0);
    glVertex2i(800,180);
    glVertex2i(0, 180);
    glEnd();
    ///---------- Arvore 01
    int treeDistance=0;
    for(int i=0;i<4;i++){
        glBegin(GL_POLYGON);
        glColor3ub(102, 51, 0);  ///Tronco
        glVertex2i(60+treeDistance,30);
        glVertex2i(70+treeDistance,30);
        glVertex2i(65+treeDistance,150);
        glEnd();
        glColor3f(0, 153, 0);   ///Copa
        desenha_circulo(50+treeDistance,100,20);     ///folha topo 01
        desenha_circulo(80+treeDistance,100,20);     ///folha topo 02
        desenha_circulo(58+treeDistance,130,18);     ///folha meio 01
        desenha_circulo(72+treeDistance,130,18);     ///folha meio 02
        desenha_circulo(65+treeDistance,150,14);     ///folha de cima
        treeDistance=treeDistance+200;
    }
    ///---------- Arvore 02
    treeDistance=100;
    for(int i=0;i<4;i++){
        glBegin(GL_POLYGON);
        glColor3ub(102, 51, 0);  ///Tronco
        glVertex2i(60+treeDistance,100);
        glVertex2i(70+treeDistance,100);
        glVertex2i(65+treeDistance,220);
        glEnd();
        glColor3f(0, 153, 0);   ///Copa
        desenha_circulo(50+treeDistance,170,20);     ///folha topo 01
        desenha_circulo(80+treeDistance,170,20);     ///folha topo 02
        desenha_circulo(58+treeDistance,200,18);     ///folha meio 01
        desenha_circulo(72+treeDistance,200,18);     ///folha meio 02
        desenha_circulo(65+treeDistance,220,14);     ///folha de cima
        treeDistance=treeDistance+200;
    }
}
void desenhaNuvem(){
    ///---------- Nuvem
    glColor3f(255, 255, 255);   ///branco nuvem
    desenha_circulo(100+move_nuvem,730,33);
    desenha_circulo(55+move_nuvem,730,23);
    desenha_circulo(145+move_nuvem,730,23);
    desenha_circulo(400+move_nuvem,730,33);
    desenha_circulo(355+move_nuvem,730,23);
    desenha_circulo(445+move_nuvem,730,23);
}
void desenhaFabrica(){
     ///---------- Fábrica
     ///fumaça da chaminé
     for(int i=0;i<300;i++){
        glColor3f(0.0f, 0.0f, 0.0f);
        if(i%2==0){
            desenha_circulo(356.5,630+move_poeira-(i*5),2);
            desenha_circulo(363.5,630+move_poeira-(i*5),2);
            desenha_circulo(370.5,630+move_poeira-(i*5),2);
        }else{
            desenha_circulo(353,630+move_poeira-(i*5),2);
            desenha_circulo(360,630+move_poeira-(i*5),2);
            desenha_circulo(367,630+move_poeira-(i*5),2);
            desenha_circulo(375,630+move_poeira-(i*5),2);
        }
    }
    glBegin(GL_POLYGON);
	glColor3ub(100, 50, 10);
    glVertex2i(350,420);
    glVertex2i(500,420);
    glVertex2i(500,590);
    glVertex2i(380,590);
    glVertex2i(380,630);
    glVertex2i(350,630);
    glEnd();
    glBegin(GL_POLYGON);
	glColor3f(0.0,0.7,1.5);
    glVertex2i(350,730);
    glVertex2i(380,730);
    glVertex2i(380,830);
    glVertex2i(350,830);
    glEnd();
    int b4y1=585,b4y2=582;
	for(int i=0;i<7;i++){
        ///---------- detalhe do prédio
        glBegin(GL_POLYGON);
        glColor3ub(100, 130, 40);
        glVertex2i(350,b4y1);
        glVertex2i(500,b4y1);
        glVertex2i(500,b4y2);
        glVertex2i(350,b4y2);
        glEnd();
        b4y1=b4y1-25;
        b4y2=b4y2-25;
	}
	int b4y01=438,b4y02=450;
    int b4x01=355,b4x02=370;
    for(int j=1;j<37;j++){
        glBegin(GL_POLYGON);
        if(j%10==0){
            glColor3f(0, 0, 0);
        }else{
             glColor3ub(242, 242, 242);
        }
        glVertex2i(b4x01,b4y01);
        glVertex2i(b4x02,b4y01);
        glVertex2i(b4x02,b4y02);
        glVertex2i(b4x01,b4y02);
        glEnd();


        b4x01=b4x01+25;
        b4x02=b4x02+25;
        if(j%6==0){
            b4x01=355;
            b4x02=370;
            b4y01=b4y01+25;
            b4y02=b4y02+25;
        }
    ///---------- Arvore da fábrica
    glBegin(GL_POLYGON);
    glColor3ub(102, 51, 0);  ///tronco
    glVertex2i(510,420);
    glVertex2i(520,420);
    glVertex2i(515,540);
    glEnd();
    glColor3f(0,153,0);      ///copa
    desenha_circulo(500,490,20);     ///folha topo 01
    desenha_circulo(530,490,20);     ///folha topo 02
    desenha_circulo(508,510,18);     ///folha meio 01
    desenha_circulo(522,510,18);     ///folha meio 02
    desenha_circulo(515,535,14);     ///folha de cima
    glEnd();
    }
}
void desenhaCidade(){
    ///---------- Sol
    glColor3f(255, 255, 0);   ///amarelo sol
    desenha_circulo(300,760,30);
    ///---------- Arvore 01
    glBegin(GL_POLYGON);
    glColor3ub(112, 51, 0);  ///tronco
    glVertex2i(310,420);
    glVertex2i(320,420);
    glVertex2i(315,540);
    glEnd();
    glColor3f(0, 153, 0);   ///copa
    desenha_circulo(300,490,20);     ///folha topo 01
    desenha_circulo(330,490,20);     ///folha topo 02
    desenha_circulo(308,510,18);     ///folha meio 01
    desenha_circulo(322,510,18);     ///folha meio 02
    desenha_circulo(315,535,14);     ///folha de cima
    ///---------- Arvore 02
    glBegin(GL_POLYGON);
    glColor3ub(112, 51, 0);  ///tronco
    glVertex2i(600,420);
    glVertex2i(610,420);
    glVertex2i(605,540);
    glEnd();
    glColor3f(0, 153, 0);   ///copa
    desenha_circulo(590,490,20);     ///folha topo 01
    desenha_circulo(620,490,20);     ///folha topo 02
    desenha_circulo(598,510,18);     ///folha meio 01
    desenha_circulo(612,510,18);     ///folha meio 02
    desenha_circulo(605,535,14);     ///folha de cima
    desenhaFabrica();
    desenhaNuvem();
    ///---------- Prédio Esquerda
    glBegin(GL_POLYGON);
	glColor3ub(10,65,120);
    glVertex2i(50,390);
    glVertex2i(150,420);
    glVertex2i(150,650);
    glVertex2i(50,650);
    glEnd();
    int buildingY1=620,buildingY2=623;
	for(int i=0;i<8;i++){
        ///---------- detalhe do prédio
        glBegin(GL_POLYGON);
        glColor3ub(160, 20, 90);
        glVertex2i(50,buildingY1);
        glVertex2i(150,buildingY1);
        glVertex2i(150,buildingY2);
        glVertex2i(50,buildingY2);
        glEnd();
        buildingY1=buildingY1-25;
        buildingY2=buildingY2-25;
	}
    ///---------- Prédio Esqueda 02
    glBegin(GL_POLYGON);
	glColor3ub(102, 51, 40);
    glVertex2i(190,420);
    glVertex2i(300,420);
    glVertex2i(300,560);
    glVertex2i(190,560);
    glEnd();

    int b3y1=430,b3y2=440;
    int b3x1=200,b3x2=215;
    for(int j=1;j<21;j++){
        glBegin(GL_POLYGON);
        ///---------- Vidro do prédio
        glColor3ub(204, 204, 255);
        glVertex2i(b3x1,b3y1);
        glVertex2i(b3x2,b3y1);
        glVertex2i(b3x2,b3y2);
        glVertex2i(b3x1,b3y2);
        glEnd();

        b3x1=b3x1+25;
        b3x2=b3x2+25;
        if(j%4==0){
            b3x1=200;
            b3x2=215;
            b3y1=b3y1+25;
            b3y2=b3y2+25;
        }
    }
    ///---------- antina
    for(int i=0;i<5;i++){
        glBegin(GL_POLYGON);
        if(i%2==0){
            glColor3ub(153, 204, 0);
        }
        else{
            glColor3ub(153,0, 0);
        }
        glVertex2i(200+(i*10),560+(i*5));
        glVertex2i(290-(i*10),560+(i*5));
        glVertex2i(290-(i*10),565+(i*5));
        glVertex2i(200+(i*10),565+(i*5));
        glEnd();
    }

    glBegin(GL_POLYGON);
	glColor3ub(102, 51, 0);
    glVertex2i(243,585);
    glVertex2i(247,585);
    glVertex2i(247,640);
    glVertex2i(243,640);
    glEnd();
}
void desenhaCarro(){
    glPushMatrix();
    desenhaCarro01();
    desenhaCarro02();
    }
void desenhaBdCarro01(){
    glVertex2i(0,330);
    glVertex2i(120,330);
    glVertex2i(120,345);
    glVertex2i(115,350);
    glVertex2i(90,350);
    glVertex2i(70,365);
    glVertex2i(40,365);
    glVertex2i(20,350);
    glVertex2i(0,350);
    glEnd();
}
///-------------------- Carro 01
void desenhaCarro01(){
    glPushMatrix();
    glTranslatef(moveCarro01, 0.0f, 0.0f);
    posCarro01=120+moveCarro01;
    ///---------- Carro
	glBegin(GL_POLYGON);
    glColor3ub(120, 50, 50);
    desenhaBdCarro01();

    glBegin(GL_LINE_LOOP);
    glColor3ub(255, 255, 255);
    desenhaBdCarro01();

    ///---------- Vidro do carro
    glBegin(GL_POLYGON);
    glColor3ub(204, 204, 100);
    glVertex2i(25,350);
    glVertex2i(85,350);
    glVertex2i(67,362);
    glVertex2i(43,362);
    glEnd();
    glColor3f(0, 0, 0);
    desenha_circulo(15+moveCarro01,330,10);
    desenha_circulo(90+moveCarro01,330,10);
    glPopMatrix();
}

void carroBdNoite(){
       glVertex2i(0,330);
    glVertex2i(120,330);
    glVertex2i(120,345);
    glVertex2i(115,350);
    glVertex2i(90,350);
    glVertex2i(70,365);
    glVertex2i(40,365);
    glVertex2i(20,350);
    glVertex2i(0,350);
    glEnd();
    ///---------- Farol
    glBegin(GL_TRIANGLES);
    glColor3f(.233,.238,.238);
    glVertex2f(120, 345);
    glVertex2f( 220, 325);
    glVertex2f( 220, 365);
    glEnd();
}

void desenhaCarroNoite(){
    glPushMatrix();
    glTranslatef(moveCarro01, 0.0f, 0.0f);
    posCarro01=120+moveCarro01;
    ///---------- Carro
	glBegin(GL_POLYGON);
    glColor3ub(0, 50, 50);
    carroBdNoite();

    glBegin(GL_LINE_LOOP);
    glColor3ub(255, 255, 255);
    desenhaBdCarro01();
    ///---------- Vidro do carro
    glBegin(GL_POLYGON);
    glColor3ub(204, 204, 255);
    glVertex2i(25,350);
    glVertex2i(85,350);
    glVertex2i(67,362);
    glVertex2i(43,362);
    glEnd();
    glColor3f(0, 0, 0);
    desenha_circulo(15+moveCarro01,330,10);
    desenha_circulo(90+moveCarro01,330,10);
    glPopMatrix();
}

void desenhaBdCarro02(){
    glVertex2i(0,260);
    glVertex2i(5,255);
    glVertex2i(120,255);
    glVertex2i(120,290);
    glVertex2i(5,290);
    glVertex2i(0,285);
    glEnd();
}
void desenhaCarro02(){
    glPushMatrix();
    glTranslatef(moveCarro02,aceleraBus, 0.0f);
    posCarro02=0+moveCarro02;
    ///---------- Onibus
	glBegin(GL_POLYGON);
	glColor3ub(70, 0, 170);
	desenhaBdCarro02();
    ///---------- Linha lateral
    glBegin(GL_LINE_LOOP);
    glColor3ub(255, 255, 255);
    desenhaBdCarro02();
    ///---------- Vidro do onibus
	glBegin(GL_POLYGON);
	glColor3ub(204, 204, 255);
    glVertex2i(90,270);
    glVertex2i(110,270);
    glVertex2i(110,280);
    glVertex2i(90,280);
    glEnd();

    glBegin(GL_POLYGON);
	glColor3ub(204, 204, 255);
    glVertex2i(65,270);
    glVertex2i(85,270);
    glVertex2i(85,280);
    glVertex2i(65,280);
    glEnd();

    glBegin(GL_POLYGON);
	glColor3ub(204, 204, 255);
    glVertex2i(60,270);
    glVertex2i(40,270);
    glVertex2i(40,280);
    glVertex2i(60,280);
    glEnd();

    glBegin(GL_POLYGON);
	glColor3ub(204, 204, 255);
    glVertex2i(35,270);
    glVertex2i(15,270);
    glVertex2i(15,280);
    glVertex2i(35,280);
    glEnd();
    glColor3f(0, 0, 0);
    desenha_circulo(20+moveCarro02,255+aceleraBus,8);
    desenha_circulo(105+moveCarro02,255+aceleraBus,8);
    desenha_circulo(85+moveCarro02,255+aceleraBus,8);
    glPopMatrix();
}

void ChuvaFunc(int value){
    if(chuva){
        _chuva += 0.01f;
        glBegin(GL_POINTS);
        for(int i=1;i<=1000;i++) {
            int x=rand(),y=rand();
            x%=1000; y%=1000;
            glBegin(GL_LINES);
             glColor3f(1.0, 1.0, 1.0);
             glVertex2d(x,y);
             glVertex2d(x+5,y+5);
            glEnd();
        }
        glutPostRedisplay();
        glutTimerFunc(5, ChuvaFunc, 0);
        glFlush();
        }
}
///-------------------- Noite
void anoitecer(){
    glClearColor(.13,.13,.13,.13);
	glClear(GL_COLOR_BUFFER_BIT);
///---------- Carro na noite
    {
    carroBdNoite();
       glColor3f(128,128,128);   ///cor do carro a noite
    desenha_circulo(300,760,20);
    ////////Garments
    for(int i=0;i<300;i++){
        glColor3f(0.0f, 0.0f, 0.0f);
        if(i%2==0){
            desenha_circulo(356.5,630+move_poeira-(i*5),2);
            desenha_circulo(363.5,630+move_poeira-(i*5),2);
            desenha_circulo(370.5,630+move_poeira-(i*5),2);
        }else{
            desenha_circulo(353,630+move_poeira-(i*5),2);
            desenha_circulo(360,630+move_poeira-(i*5),2);
            desenha_circulo(367,630+move_poeira-(i*5),2);
            desenha_circulo(375,630+move_poeira-(i*5),2);
        }
    }
     glBegin(GL_POLYGON);
	glColor3ub(96,96,96);
    glVertex2i(350,420);
    glVertex2i(500,420);
    glVertex2i(500,590);
    glVertex2i(380,590);
    glVertex2i(380,630);
    glVertex2i(350,630);
    glEnd();

    glBegin(GL_POLYGON);
glColor3ub(33,33,33);
    glVertex2i(350,730);
    glVertex2i(380,730);
    glVertex2i(380,830);
    glVertex2i(350,830);
    glEnd();

    int b4y1=585,b4y2=582;
	for(int i=0;i<7;i++){
        ///---------- piso da fábrica
        glBegin(GL_POLYGON);
        glColor3ub(153, 153, 102);
        glVertex2i(350,b4y1);
        glVertex2i(500,b4y1);
        glVertex2i(500,b4y2);
        glVertex2i(350,b4y2);
        glEnd();
        b4y1=b4y1-25;
        b4y2=b4y2-25;
	}
	int b4y01=438,b4y02=450;
    int b4x01=355,b4x02=370;

    for(int j=1;j<37;j++){
        glBegin(GL_POLYGON);
        if(j%10==0){
            glColor3f(96,96,96);
        }else{
             glColor3ub(10,10,10);
        }
        glVertex2i(b4x01,b4y01);
        glVertex2i(b4x02,b4y01);
        glVertex2i(b4x02,b4y02);
        glVertex2i(b4x01,b4y02);
        glEnd();

        b4x01=b4x01+25;
        b4x02=b4x02+25;
        if(j%6==0){
            b4x01=355;
            b4x02=370;
            b4y01=b4y01+25;
            b4y02=b4y02+25;
        }
      ///---------- Nuvem a noite
    glColor3ub(191, 192, 192);   //cloud color
    desenha_circulo(100+move_nuvem,730,33);
    desenha_circulo(55+move_nuvem,730,23);
    desenha_circulo(145+move_nuvem,730,23);

    desenha_circulo(400+move_nuvem,730,33);
    desenha_circulo(355+move_nuvem,730,23);
    desenha_circulo(445+move_nuvem,730,23);
    glEnd();
     ///---------- Arvore da fábrica
     glBegin(GL_POLYGON);
    glColor3ub(70, 31, 0);  //tree body color
    glVertex2i(310,420);
    glVertex2i(320,420);
    glVertex2i(315,540);
    glEnd();
    glColor3ub(6,77,11);   //tree leaf color
    desenha_circulo(300,490,20);     //tree  top 1st leaf
    desenha_circulo(330,490,20);     //tree top 2nd leaf
    desenha_circulo(308,510,18);     //tree middle 1st leaf
    desenha_circulo(322,510,18);     //tree middle 2nd leaf
    desenha_circulo(315,535,14);     //tree top leaf
    ///---------- Arvore da direita
    glBegin(GL_POLYGON);
    glColor3ub(70, 31, 0);  //tree body color
    glVertex2i(600,420);
    glVertex2i(610,420);
    glVertex2i(605,540);
    glEnd();
    glColor3ub(6,88,11);   //tree leaf color
    desenha_circulo(590,490,20);     //tree  top 1st leaf
    desenha_circulo(620,490,20);     //tree top 2nd leaf
    desenha_circulo(598,510,18);     //tree middle 1st leaf
    desenha_circulo(612,510,18);     //tree middle 2nd leaf
    desenha_circulo(605,535,14);     //tree top leaf
     ///---------- Prédio esquerda 02
    glBegin(GL_POLYGON);
	glColor3ub(102, 51, 40);
    glVertex2i(190,420);
    glVertex2i(300,420);
    glVertex2i(300,560);
    glVertex2i(190,560);
    glEnd();

    int b3y1=430,b3y2=440;
    int b3x1=200,b3x2=215;
    for(int j=1;j<21;j++){
        glBegin(GL_POLYGON);
        glColor3ub(64, 64, 55);
        glVertex2i(b3x1,b3y1);
        glVertex2i(b3x2,b3y1);
        glVertex2i(b3x2,b3y2);
        glVertex2i(b3x1,b3y2);
        glEnd();

        b3x1=b3x1+25;
        b3x2=b3x2+25;
        if(j%4==0){
            b3x1=200;
            b3x2=215;
            b3y1=b3y1+25;
            b3y2=b3y2+25;
        }
    }
    ///---------- Resto dos prédios a esquerda
    glBegin(GL_POLYGON);
	glColor3ub(25,71,95);
    glVertex2i(50,390);
    glVertex2i(150,420);
    glVertex2i(150,650);
    glVertex2i(50,650);
    glEnd();

    int buildingY1=620,buildingY2=623;
	for(int i=0;i<8;i++){
        ///---------- piso do prédio 01
        glBegin(GL_POLYGON);
        glColor3ub(153, 153, 102);
        glVertex2i(50,buildingY1);
        glVertex2i(150,buildingY1);
        glVertex2i(150,buildingY2);
        glVertex2i(50,buildingY2);
        glEnd();
        buildingY1=buildingY1-25;
        buildingY2=buildingY2-25;
	}
    glBegin(GL_POLYGON);
	glColor3ub(102, 51, 0);
    glVertex2i(243,585);
    glVertex2i(247,585);
    glVertex2i(247,640);
    glVertex2i(243,640);
    glEnd();

    desenhaRua();
    desenhaCarroNoite();
}
    ///---------- Grama da arvore
    glBegin(GL_POLYGON);
	glColor3f(0,0.60,0);     ///verde
    glVertex2i(0,0);
    glVertex2i(800, 0);
    glVertex2i(800,180);
    glVertex2i(0, 180);
    glEnd();
    int treeDistance=0;
    for(int i=0;i<4;i++){
        glBegin(GL_POLYGON);
        glColor3ub(70, 31, 0); //tree body color
        glVertex2i(60+treeDistance,30);
        glVertex2i(70+treeDistance,30);
        glVertex2i(65+treeDistance,150);
        glEnd();
        glColor3ub(6,88,11);   //tree leaf color
        desenha_circulo(50+treeDistance,100,20);     //tree  top 1st leaf
        desenha_circulo(80+treeDistance,100,20);     //tree top 2nd leaf
        desenha_circulo(58+treeDistance,130,18);     //tree middle 1st leaf
        desenha_circulo(72+treeDistance,130,18);     //tree middle 2nd leaf
        desenha_circulo(65+treeDistance,150,14);     //tree top leaf
        treeDistance=treeDistance+200;
    }
    treeDistance=100;
    for(int i=0;i<4;i++){
        glBegin(GL_POLYGON);
        glColor3ub(70, 31, 0);  //tree body color
        glVertex2i(60+treeDistance,100);
        glVertex2i(70+treeDistance,100);
        glVertex2i(65+treeDistance,220);
        glEnd();
        glColor3ub(6,88,11);   //tree leaf color
        desenha_circulo(50+treeDistance,170,20);     //tree  top 1st leaf
        desenha_circulo(80+treeDistance,170,20);     //tree top 2nd leaf
        desenha_circulo(58+treeDistance,200,18);     //tree middle 1st leaf
        desenha_circulo(72+treeDistance,200,18);     //tree middle 2nd leaf
        desenha_circulo(65+treeDistance,220,14);     //tree top leaf
        treeDistance=treeDistance+200;
    }
    glFlush ();
    glEnd();
    }

}
void dia(){
    glClearColor(0.0,0.7,1.5,0.0);
	glClear(GL_COLOR_BUFFER_BIT);
{
    desenhaCidade();
    desenhaNuvem();
    desenhaRua();
    desenhaCarro();
    desenhaCarro01();
    desenhaCarro02();
    desenhaGramado();
     glFlush ();
    glEnd();
    }
}
void myDisplay(void) {
    glClear (GL_COLOR_BUFFER_BIT);
    desenhaCidade();
    desenhaRua();
    desenhaCarro();
    desenhaGramado();
    glFlush ();
}
void myInit (void) {
    glClearColor(0.0,0.7,1.5,0.0);  ///cor do céu
    glColor3f(0.0f, 0.0f, 0.0f);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluOrtho2D(0.0, 800.0, 0.0, 800.0);
}

static void getMouseInputs(GLint mouseButton, GLint mouseAction, int Xmouse , int Ymouse){
    if(mouseButton==GLUT_RIGHT_BUTTON&&mouseAction==GLUT_DOWN){
        glPushMatrix();
        chuva = true;
        ChuvaFunc(_chuva);
        glPopMatrix();
        glFlush();
    }else if(mouseButton==GLUT_LEFT_BUTTON&&mouseAction==GLUT_DOWN){
        glPushMatrix();
        chuva = false;
        glPopMatrix();
        glFlush();
    }
}
void keyboard(unsigned char key, int x, int y) {
    if(key=='s' &&  (aceleraBus+270)<320) {
        ///avança o carro 01
        moveCarro01=moveCarro01+5;
        glutPostRedisplay();
    }
    else if(key=='d' &&  (aceleraBus+270)<320){
        ///avança o carro 02
        moveCarro02=moveCarro02-5;
        glutPostRedisplay();
    }
   switch(key){
       case 'e':
           exit(0);
           break;
        case 'm':
            ///fica de dia
            glutDisplayFunc(dia);
            glutPostRedisplay();
            break;
        case 'n':
            ///fica de noite
            glutDisplayFunc(anoitecer);
            glutPostRedisplay();
            break;
        }
}
void mySpecialKeyFunc(GLint specialKey, int Xmouse, int Ymouse){
switch(specialKey){
        case GLUT_KEY_LEFT:
            moveCarro01=moveCarro01 - 10;
            glutPostRedisplay();
            break;
        case GLUT_KEY_RIGHT:
            moveCarro02= moveCarro02 + 10;
            glutPostRedisplay();
            break;
        }
        glFlush();
    }
void noite(int value) {
    glutDisplayFunc(anoitecer);
}

void update(int value) {
    moveCarro01 = moveCarro01+2;  //Velocidade inicial
    moveCarro02 = moveCarro02-2;  //Velocidade inicial
    if(moveCarro02< 0 && moveCarro01> 800)
    {
        moveCarro01 =-200;
        moveCarro02 =1000;
    }
    move_nuvem=move_nuvem+.5;
    if(move_nuvem> 800)
    {
        move_nuvem =-500;
    }
    move_poeira=move_poeira+.2;
	glutPostRedisplay(); //Avisar o GLUT que o display mudou
	glutTimerFunc(25, update, 0);   //Avisar para chamar o update no tempo de 25 miliseg
}

void desenha_circulo(float x, float y, float radius) {
    glMatrixMode(GL_MODELVIEW);
    glPushMatrix();
    glLoadIdentity();
    glTranslatef(x, y, 0.0f);
    static const int circle_points = 100;
    static const float angle = 2.0f * 3.1416f / circle_points;

    glBegin(GL_POLYGON);
    double angle1=0.0;
    glVertex2d(radius * cos(0.0) , radius * sin(0.0));
    for (int i=0; i<circle_points; i++)
    {
        glVertex2d(radius * cos(angle1), radius *sin(angle1));
        angle1 += angle;
    }
    glEnd();
    glPopMatrix();
}

int main(int argc, char* argv[]) {
    glutInit(&argc, argv);
    glutInitDisplayMode (GLUT_SINGLE | GLUT_RGB);
    glutInitWindowSize (800, 600);
    glutInitWindowPosition (500,50);
    printf("  Universidade Federal de Sao Paulo - SJC\n");
    printf("  Kevin Lourenco Tome - 135065\n");
    printf("  Computacao Grafica 2/2021\n");
    printf("  Profa. Ana Luisa D. M. Lemos\n");
    printf("\n");
    printf("  Controles\n");
    printf("  Botao Direito  ---> Chuva\n  Botao Esquerdo  ---> Para a chuva\n");
    printf("  Tecla 'n'  ---> Noite\n  Tecla 'm'  ---> Dia\n");
    printf("  Tecla 's'  ---> Avancar o carro de cima\n  Tecla 'd'  ---> Avancar o carro de baixo\n");
    printf("  Tecla '<-'  ---> Atrasar o carro de cima\n  Tecla '->'  ---> Atrasar o carro de baixo\n ");
    glutCreateWindow ("Projeto Final - Ambiente Urbano" );
    glutDisplayFunc(myDisplay);
    glutTimerFunc(25, update, 100); //Animação
    glutKeyboardFunc(keyboard);     //Comandos
    glutMouseFunc(getMouseInputs);   //Mouse
    glutSpecialFunc(mySpecialKeyFunc);
    myInit ();
    glutMainLoop();
}

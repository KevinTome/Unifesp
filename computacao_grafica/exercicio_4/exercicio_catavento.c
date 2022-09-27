#include <windows.h>
#include <GL/glut.h>
#include <GL/gl.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define MAX 100
#define MIN 0

float angZ = 0.0;
int temp = MAX;
int opcao = 0;

void init(){
     glClearColor(0.0,0.0,0.0,0.0);
     glEnable(GL_DEPTH_TEST); //habilita o teste de profundidade
     glMatrixMode(GL_MODELVIEW);
     glLoadIdentity();
     glOrtho(-7.0,7.0,-7.0,7.0,-7.0,7.0);
     glPushMatrix();
}

void display()
{
     glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
     glColor3f(0.0,0.0,1.0);

     //Miolo
	 glColor3f(1,1,1);
	 glPushMatrix();
     glRotatef(angZ,0,0,1);
     glutWireSphere(1,25,25);
	 glPopMatrix();

	 //petala
	 glColor3f(1,1,1);
	 glPushMatrix();
     glRotatef(angZ,0,0,1);
     glTranslatef(0,1.75,0);
     glutWireOctahedron();
	 glPopMatrix();

	 //petala
	 glColor3f(1,1,1);
	 glPushMatrix();
     glRotatef(angZ,0,0,1);
     glTranslatef(0,-1.75,0);
     glutWireOctahedron();
	 glPopMatrix();

	 //petala
	 glColor3f(1,1,1);
	 glPushMatrix();
     glRotatef(angZ,0,0,1);
     glTranslatef(1.75,0,0);
     glutWireOctahedron();
	 glPopMatrix();

	 //petala
	 glColor3f(1,1,1);
	 glPushMatrix();
     glRotatef(angZ,0,0,1);
     glTranslatef(-1.75,0,0);
     glutWireOctahedron();
	 glPopMatrix();



     glFlush();
}

void timerFunc(int value)
{
    switch (opcao) {
        case 1:
            angZ+=5;
            break;
        case 2:
            angZ-=5;
            break;
        default:
            break;
    }
    glutPostRedisplay();
    glutTimerFunc(temp,timerFunc, 1);
}

void rotacoes(int key, int x, int y){
     switch (key){
        case GLUT_KEY_LEFT :
           if(temp>=MAX){
                break;
           }
           temp+=5;
           opcao = 1;
           break ;
        case GLUT_KEY_RIGHT :
           if(temp<=MIN){
                break;
           }
           temp-=5;
           opcao = 2;
           break ;
        default:
           break;
     }
     glutPostRedisplay() ;
}

int main(int argc, char *argv[])
{
     glutInit(&argc,argv);
     glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB | GLUT_DEPTH);
     glutInitWindowPosition(50,50);
     glutInitWindowSize(600,600);
     glutCreateWindow("Kevin Tome 135065 - Exercicio: Catavendo");
     glutDisplayFunc(display);
     glutSpecialFunc(rotacoes);
     glutTimerFunc(temp,timerFunc,1);
     init();
     glutMainLoop();
}

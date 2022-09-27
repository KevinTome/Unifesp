#include <windows.h>
#include <GL/glut.h>
#include <GL/gl.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define PI 3.141592654

void init(){
     glClearColor(0.0,0.0,0.0,0.0);
     //glEnable(GL_DEPTH_TEST); //habilita o teste de profundidade
     glMatrixMode(GL_MODELVIEW);
     glLoadIdentity();
     glOrtho(-7,7,-7,7,-7,7);
     glPushMatrix();
}

void display()
{
     glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT); //limpa o buffer

    //Cabeca
	 glColor3f(1,1,1);
	 glPushMatrix();
     glRotatef(0,1,0,0);
     glRotatef(0,0,1,0);
     //glTranslated(0.3, 0, 0);
     glutSolidSphere(3,50,50);
	 glPopMatrix();

	 //Nariz
	 glColor3f(1,0,0);
	 glPushMatrix();
     glRotatef(0,1,0,0);
     glRotatef(0,0,1,0);
     glTranslated(0, 0, 0.5);
     glutSolidSphere(0.75,50,50);
	 glPopMatrix();

	 //Olho Direito
	 glColor3f(0,0,0);
	 glPushMatrix();
     glRotatef(0,1,0,0);
     glRotatef(0,0,1,0);
     glTranslated(1.35, 1.35, 0.35);
     glutSolidSphere(0.5,50,50);
	 glPopMatrix();

	 //Olho Esquerdo
	 glColor3f(0,0,0);
	 glPushMatrix();
     glRotatef(0,1,0,0);
     glRotatef(0,0,1,0);
     glTranslated(-1.35, 1.35, 0.35);
     glutSolidSphere(0.5,50,50);
	 glPopMatrix();

	 //Cabelin
	 glColor3f(1,0,0);
	 glPushMatrix();
     glRotatef(0,1,0,0);
     glRotatef(0,0,1,0);
     glTranslated(2.50, 2, 0.35);
     glutSolidSphere(0.60,50,50);
	 glPopMatrix();

	 glColor3f(1,0,0);
	 glPushMatrix();
     glRotatef(0,1,0,0);
     glRotatef(0,0,1,0);
     glTranslated(-2.50, 2, 0.35);
     glutSolidSphere(0.60,50,50);
	 glPopMatrix();

	 glColor3f(1,0,0);
	 glPushMatrix();
     glRotatef(0,1,0,0);
     glRotatef(0,0,1,0);
     glTranslated(2.95, 1.1, 0.35);
     glutSolidSphere(0.85,50,50);
	 glPopMatrix();

	 glColor3f(1,0,0);
	 glPushMatrix();
     glRotatef(0,1,0,0);
     glRotatef(0,0,1,0);
     glTranslated(-2.95, 1.1, 0.35);
     glutSolidSphere(0.85,50,50);
	 glPopMatrix();

     glFlush();
}

int main(int argc, char *argv[])
{
     glutInit(&argc,argv);
     glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB | GLUT_DEPTH);
     glutInitWindowPosition(50,50);
     glutInitWindowSize(600,600);
     glutCreateWindow("Kevin Tome 135065 - Exercicio: Palhaço");
     glutDisplayFunc(display);
     init();
     glutMainLoop();
}

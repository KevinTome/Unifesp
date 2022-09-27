#include <windows.h>
#include <GL/glut.h>
#include <GL/gl.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define PI 3.14159265
#define VAL PI/360

float offset = -1;
float grau = 0.0;
float step = 0.0125;

void init(){
    glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
    glEnable(GL_DEPTH_TEST);
}

void drawCube(){
    glColor3f(1.0,0.0,0.0);
    glBegin(GL_POLYGON);
    glVertex3f(-0.5,-0.5,0.5);
    glVertex3f(0.5,-0.5,0.5);
    glVertex3f(0.5,0.5,0.5);
    glVertex3f(-0.5,0.5,0.5);
    glEnd();

    glColor3f(0.0,1.0,0.0);
    glBegin(GL_POLYGON);
    glVertex3f(0.5,0.5,0.5);
    glVertex3f(0.5,-0.5,0.5);
    glVertex3f(0.5,-0.5,-0.5);
    glVertex3f(0.5,0.5,-0.5);
    glEnd();

    glColor3f(0.0,0.0,1.0);
    glBegin(GL_POLYGON);
    glVertex3f(0.5,-0.5,0.5);
    glVertex3f(-0.5,-0.5,0.5);
    glVertex3f(-0.5,-0.5,-0.5);
    glVertex3f(0.5,-0.5,-0.5);
    glEnd();

    glColor3f(1.0,1.0,0.0);
    glBegin(GL_POLYGON);
    glVertex3f(-0.5,0.5,0.5);
    glVertex3f(0.5,0.5,0.5);
    glVertex3f(0.5,0.5,-0.5);
    glVertex3f(-0.5,0.5,-0.5);
    glEnd();

    glColor3f(0.0,1.0,1.0);
    glBegin(GL_POLYGON);
    glVertex3f(-0.5,-0.5,-0.5);
    glVertex3f(-0.5,0.5,-0.5);
    glVertex3f(0.5,0.5,-0.5);
    glVertex3f(0.5,-0.5,-0.5);
    glEnd();

    glColor3f(1.0,1.0,1.0);
    glBegin(GL_POLYGON);
    glVertex3f(-0.5,0.5,-0.5);
    glVertex3f(-0.5,-0.5,-0.5);
    glVertex3f(-0.5,-0.5,0.5);
    glVertex3f(-0.5,0.5,0.5);
    glEnd();
}

void displayFunc() {
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    glPushMatrix();
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    gluPerspective(120.0, 1.0, 1, 40.0);
    gluLookAt(-2, -1, -1, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);
    glViewport(-150, 150, 500, 500);
    drawCube();
    glPopMatrix();

    glPushMatrix();
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    gluPerspective(135, 1.0, 0.5, 40.0);
    gluLookAt(sin(grau*VAL)+cos(grau*VAL),-0.8,cos(grau*VAL)-sin(grau*VAL), 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);
    glViewport(150, 150, 500, 500);
    drawCube();
    glPopMatrix();

    glPushMatrix();
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    gluPerspective(120.0, 1.0, 1, 40.0);
    printf("%f\n", sin(grau*VAL)+cos(grau*VAL));
    gluLookAt(-2, sin(grau*VAL)+cos(grau*VAL), -1, 0, sin(grau*VAL)+cos(grau*VAL), 0, 0.0, 1.0, 0.0);
    glViewport(-150, -150, 500, 500);
    drawCube();
    glPopMatrix();

    glPushMatrix();
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    gluPerspective(120.0, 1.0, 1, 40.0);
    gluLookAt(offset*2, offset, offset, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);
    glViewport(150, -150, 500, 500);
    drawCube();
    glPopMatrix();

    glFlush();
    glutSwapBuffers();
}

void timerFunc(int value) {
    if(offset<=-5.0 || offset> -1) {
        step = step*(-1);
    }
    offset += step;
    grau += 5;

	glutPostRedisplay();
	glutTimerFunc(1,timerFunc, 1);
}

int main(int argc, char *argv[]){
    glutInit(&argc,argv);
	glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
    glutInitWindowPosition(50,50);
    glutInitWindowSize(500,500);
	glutCreateWindow("Kevin Tomé 135065 - Execicio Prático");
	glutDisplayFunc(displayFunc);
	glutTimerFunc(1,timerFunc,1);
	init();
	glutMainLoop();
	return 0;
}

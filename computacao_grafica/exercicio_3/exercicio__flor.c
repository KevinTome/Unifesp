#include <windows.h>
#include <GL/glut.h>
#include <GL/gl.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define PI 3.141592654

float theta=0.0;
float right=0.0;

void circulo(){
    int i;
    float angulo = 0.0;
    glBegin(GL_POLYGON);
        for (i=0;i<=10;i++) {
            angulo= 2 * PI * i / 10.0;
            glVertex2f(0.25*cos(angulo), 0.25*sin(angulo));
        }
    glEnd ();
}

void quadrado(){
    glBegin(GL_POLYGON);
        glVertex2f(-0.125, 0.125);
        glVertex2f(0.125, 0.125);
        glVertex2f(0.125, -0.125);
        glVertex2f(-0.125, -0.125);
    glEnd();
}

void desenha(){
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();

    glClearColor(0, 0, 0, 0); //Preto
    glClear(GL_COLOR_BUFFER_BIT);

    glPushMatrix();
    glColor3f(1.0,1.0,0.0);
    glRotatef(theta,0.0,0.0,1.0);
    glTranslatef(0.25,0.25,0.0);
    quadrado();
    glPopMatrix();

    glPushMatrix();
    glColor3f(1.0,1.0,0.0);
    glRotatef(theta,0.0,0.0,1.0);
    glTranslatef(-0.25,0.25,0.0);
    quadrado();
    glPopMatrix();

    glPushMatrix();
    glColor3f(1.0,1.0,0.0);
    glRotatef(theta,0.0,0.0,1.0);
    glTranslatef(0.25,-0.25,0.0);
    quadrado();
    glPopMatrix();

    glPushMatrix();
    glColor3f(1.0,1.0,0.0);
    glRotatef(theta,0.0,0.0,1.0);
    glTranslatef(-0.25,-0.25,0.0);
    quadrado();
    glPopMatrix();

    glPushMatrix();
    glColor3f(0.1,0.1,0.1);
    //glRotatef(theta,0.0,0.0,1.0);
    circulo();
    glPopMatrix();

    glTranslatef(right,0.0,0.0);

    glFlush();
}

void tecladoEspecial(int tecla, int x, int y){
    switch (tecla) {
        case GLUT_KEY_RIGHT:
            //right+=0.05;
            theta-=5;
            break;
        case GLUT_KEY_LEFT:
            //right-=0.05;
            theta+=5;
            break;

        default:
            break;
    }
    glutPostRedisplay();
}

int main ( int argc , char * argv [] ){
    glutInit(&argc , argv);
    glutInitDisplayMode (GLUT_SINGLE | GLUT_RGB);
    glutInitWindowPosition (50 ,100);
    glutInitWindowSize (400 ,400);
    glutCreateWindow ("Exercicio Flor - Kevin Tome 135065");
    glutDisplayFunc (desenha);
    glutSpecialFunc(tecladoEspecial);
    glutMainLoop ();
    return 0;
}

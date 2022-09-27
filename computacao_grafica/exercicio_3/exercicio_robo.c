#include <windows.h>
#include <GL/glut.h>
#include <GL/gl.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define PI 3.141592654

float theta=0.0;
float right=0.0;
float alfa=0.0;

void quadrado(){
    glBegin(GL_POLYGON);
        glVertex2f(-0.125, 0.125);
        glVertex2f(0.125, 0.125);
        glVertex2f(0.125, -0.125);
        glVertex2f(-0.125, -0.125);
    glEnd();
}

void quadradoCabeca(){
    glBegin(GL_POLYGON);
        glVertex2f(-0.1, 0.1);
        glVertex2f(0.1, 0.1);
        glVertex2f(0.1, -0.1);
        glVertex2f(-0.1, -0.1);
    glEnd();
}

void quadradoFinoBraco(){
    glBegin(GL_POLYGON);
        glVertex2f(-0.125, 0.1);
        glVertex2f(0.125, 0.1);
        glVertex2f(0.125, -0.1);
        glVertex2f(-0.125, -0.1);
    glEnd();
}

void quadradoFinoPerna(){
    glBegin(GL_POLYGON);
        glVertex2f(-0.1, 0.125);
        glVertex2f(0.1, 0.125);
        glVertex2f(0.1, -0.125);
        glVertex2f(-0.1, -0.125);
    glEnd();
}

void desenha(){
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();

    glClearColor(0, 0, 0, 0); //Preto
    glClear(GL_COLOR_BUFFER_BIT);

    //BRAÇO DIREITO
    glPushMatrix();
    glColor3f(1.0,1.0,0.0);
    glRotatef(alfa,0.0,0.0,1.0);
    glTranslatef(0.25,0.125,0.0);
    quadradoFinoBraco();
    glPopMatrix();

    //BRAÇO ESQUERDO
    glPushMatrix();
    glColor3f(1.0,1.0,0.0);
    glRotatef(alfa,0.0,0.0,1.0);
    glTranslatef(-0.25,0.125,0.0);
    quadradoFinoBraco();
    glPopMatrix();

    //PERNA DIREITA
    glPushMatrix();
    glColor3f(1.0,1.0,0.0);
    glRotatef(theta,0.0,0.0,1.0);
    glTranslatef(0.170,-0.25,0.0);
    quadradoFinoPerna();
    glPopMatrix();

    //PERNA ESQUERDA
    glPushMatrix();
    glColor3f(1.0,1.0,0.0);
    glRotatef(theta,0.0,0.0,1.0);
    glTranslatef(-0.170,-0.25,0.0);
    quadradoFinoPerna();
    glPopMatrix();

    //CORPO
    glPushMatrix();
    glColor3f(0.1f, 0.1f, 0.0f);//Bronze
    //glRotatef(theta,0.0,0.0,1.0);
    glTranslatef(0.0,0.0,0.0);
    quadrado();
    glPopMatrix();

    //CABEÇA
    glPushMatrix();
    glColor3f(0.1f, 0.1f, 0.1f);//Dark grey
    //glRotatef(theta,0.0,0.0,1.0);
    glTranslatef(0.0,0.25,0.0);
    quadradoCabeca();
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
        case GLUT_KEY_UP:
            //right-=0.05;
            alfa+=5;
            break;
        case GLUT_KEY_DOWN:
            //right-=0.05;
            alfa-=5;
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
    glutCreateWindow ("Exercicio Robo - Kevin Tome 135065");
    glutDisplayFunc (desenha);
    glutSpecialFunc(tecladoEspecial);
    glutMainLoop ();
    return 0;
}

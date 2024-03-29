#include <stdio.h>
#include <stdlib.h>
#include <GL/glut.h>

void desenha(){
    glClearColor(0.0, 0.0, 0.0, 0.0);
    glClear(GL_COLOR_BUFFER_BIT);
    glBegin(GL_TRIANGLES);
        glColor3f(1.0, 0.0, 0.0); glVertex2f(-0.8,-0.8);
        glColor3f(0.0, 1.0, 0.0); glVertex2f(0.8, -0.8);
        glColor3f(0.0, 0.0, 1.0); glVertex2f(0.0, 0.8);
    glEnd();
    glFlush();
}
/*
void teclado (unsigned char key, int x, int y) {
    switch(key) {
        case �s�:
        case �S�: glShadeModel(GL_SMOOTH);
            break;
        case �f�:
        case �F�: glShadeModel(GL_FLAT);
            break;
    }
    glutPostRedisplay();
}
*/
/*
void tecladoEspecial (int key, int x, int y) {
    switch(key) {
        case GLUT_KEY_LEFT:
        case GLUT_KEY_UP: glShadeModel(GL_SMOOTH);
            break;
        case GLUT_KEY_RIGHT:
        case GLUT_KEY_DOWN: glShadeModel(GL_FLAT);
            break;
    }
    glutPostRedisplay();
}
*/
void mouse (int botao, int estado, int x, int y) {
    switch(botao) {
        case GLUT_LEFT_BUTTON:
            if(estado == GLUT_DOWN)
                glShadeModel(GL_SMOOTH);
            break;
        case GLUT_RIGHT_BUTTON:
            if(estado == GLUT_DOWN)
                glShadeModel(GL_FLAT);
            break;
    }
    glutPostRedisplay();
}

int main( int argc, char *argv[ ] ) {
    glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);
    glutInitWindowPosition(50,100);
    glutInitWindowSize(600,600);
    glutInit(&argc, argv);
    glutCreateWindow("Exercicio 1: Kevin Tom� 135065");
    glutDisplayFunc(desenha);
    //glutKeyboardFunc(teclado);
    //glutSpecialFunc(tecladoEspecial);
    glutMouseFunc(mouse);
    glutMainLoop ();
    return 0;
}

#include <windows.h>
#include <GL/glut.h>
#include <GL/gl.h>
#define xtotal_tela 400.0
#define ytotal_tela 400.0

//VARIAVEIS GLOBAIS
float x_porcentagemTela;
float y_porcentagemTela;
int R = 0.0, G = 0.0, B = 1.0;

void quadrado(){
    printf("x_porcentagemTela = %i e y_porcentagemTela = %i\n", x_porcentagemTela, y_porcentagemTela);
    glBegin(GL_POLYGON);
        glVertex2f(-0.025+x_porcentagemTela, 0.025+y_porcentagemTela);
        glVertex2f(0.025+x_porcentagemTela, 0.025+y_porcentagemTela);
        glVertex2f(0.025+x_porcentagemTela, -0.025+y_porcentagemTela);
        glVertex2f(-0.025+x_porcentagemTela, -0.025+y_porcentagemTela);
    glEnd();
}

void desenha(){
    glClearColor(0, 0, 0, 0); //Preto
    glClear(GL_COLOR_BUFFER_BIT);
    glColor3f(R,G,B);
    quadrado();
    //quadradoInicial();
    glFlush();
}

void teclado(unsigned char tecla, int x, int y){
    switch (tecla) {
        case '0':
            R = 0.0;
            G = 0.0;
            B = 1.0;
            break;
        case '1':
            G = 1.0;
            break;
        case '2':
            R = 1.0;
            break;
        case '3':
            R = 0.0;
            G = 1.0;
            B = 1.0;
            break;
        case '4':
            R = 1.0;
            G = 0.0;
            B = 1.0;
            break;
        case '5':
            R = 1.0;
            G = 1.0;
            B = 0.0;
            break;
        case '6':
            R = 1.0;
            G = 0.5;
            B = 0.5;
            break;
        case '7':
            R = 1.0;
            G = 0.5;
            break;
        case '8':
            R = 0.5;
            G = 1.0;
            B = 0.5;
            break;
        case '9':
            R = 0.5;
            G = 1.0;
            B = 1.0;
            break;

        default:
            break;
    }
    glutPostRedisplay();
}

void mouse(int botao, int estado, int x, int y){
    switch (botao) {
        case GLUT_LEFT_BUTTON:
            if(estado==GLUT_DOWN)
                x_porcentagemTela = (x / xtotal_tela)*2.0 - 1.0;
                y_porcentagemTela = ((y / ytotal_tela)*2.0 - 1.0)*-1;
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
    glutCreateWindow ("Exercicio 2: Kevin Tomé 135065");
    glutDisplayFunc (desenha);
    glutMouseFunc(mouse);
    glutKeyboardFunc(teclado);

    glutMainLoop ();
    return 0;
}

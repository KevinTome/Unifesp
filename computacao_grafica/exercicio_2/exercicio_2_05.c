#include <windows.h>
#include <GL/glut.h>
#include <GL/gl.h>
#define xtotal_tela 400.0
#define ytotal_tela 400.0

//VARIAVEIS GLOBAIS
float x_porcentagemTela_primClick;
float y_porcentagemTela_primClick;
float x_porcentagemTela_segClick;
float y_porcentagemTela_segClick;
float x_porcentagemTela_terClick;
float y_porcentagemTela_terClick;
int R = 0.0, G = 0.0, B = 1.0;
int primClick = 1;
int funcDesenha = TRUE;     //true -> Linhas, false-> triangulos

void quadrado(){
    //printf("x_porcentagemTela = %i e y_porcentagemTela = %i\n", x_porcentagemTela, y_porcentagemTela);
    if(funcDesenha){
       glBegin(GL_LINES);
            glVertex2f(x_porcentagemTela_primClick, y_porcentagemTela_primClick);
            glVertex2f(x_porcentagemTela_segClick, y_porcentagemTela_segClick);
        glEnd();
    }else{
        glBegin(GL_TRIANGLE_STRIP);
            glVertex2f(x_porcentagemTela_primClick, y_porcentagemTela_primClick);
            glVertex2f(x_porcentagemTela_segClick, y_porcentagemTela_segClick);
            glVertex2f(x_porcentagemTela_terClick, y_porcentagemTela_terClick);
        glEnd();
    }
}

void desenha(){
    glClearColor(0, 0, 0, 0); //Preto
    //glClear(GL_COLOR_BUFFER_BIT);
    glColor3f(R,G,B);
    quadrado();
    //quadradoInicial();
    glFlush();
}

void teclado(unsigned char tecla, int x, int y){
    switch (tecla) {
        case 'r':
            funcDesenha = TRUE;
            glClear(GL_COLOR_BUFFER_BIT);
            break;
        case 'R':
            funcDesenha = TRUE;
            glClear(GL_COLOR_BUFFER_BIT);
            break;
        case 't':
            funcDesenha = FALSE;
            glClear(GL_COLOR_BUFFER_BIT);
            break;
        case 'T':
            funcDesenha = FALSE;
            glClear(GL_COLOR_BUFFER_BIT);
            break;
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
                if(primClick == 1){
                    x_porcentagemTela_primClick = (x / xtotal_tela)*2.0 - 1.0;
                    y_porcentagemTela_primClick = ((y / ytotal_tela)*2.0 - 1.0)*-1;
                    primClick = 2;
                } else if(primClick == 2){
                    x_porcentagemTela_segClick = (x / xtotal_tela)*2.0 - 1.0;
                    y_porcentagemTela_segClick = ((y / ytotal_tela)*2.0 - 1.0)*-1;
                    if(funcDesenha){
                        primClick = 1;
                    }else{
                        primClick = 3;
                    }
                } else {
                    x_porcentagemTela_segClick = (x / xtotal_tela)*2.0 - 1.0;
                    y_porcentagemTela_segClick = ((y / ytotal_tela)*2.0 - 1.0)*-1;
                    primClick = 1;
                }
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
    glutCreateWindow ("Exercicio 5: Kevin Tomé 135065");
    glutDisplayFunc (desenha);
    glutMouseFunc(mouse);
    glutKeyboardFunc(teclado);

    glutMainLoop ();
    return 0;
}

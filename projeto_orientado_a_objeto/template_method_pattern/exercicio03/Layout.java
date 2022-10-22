import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.*;

public class Layout implements ActionListener{

	// Variáveis do layout
	JFrame frame;
	JLabel lblClasse;
	JTextField txtClasse;
	JLabel lblMensagem;
	JTextField txtMensagem;
	JButton btnGravar;
	
	public Layout() {
		
		// Cria layout
		frame = new JFrame();
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setSize(200,200);
		frame.getContentPane().setBackground(new Color(200,200,200));
		frame.setLayout(new FlowLayout());		
		Dimension dim = Toolkit.getDefaultToolkit().getScreenSize();
		frame.setLocation(dim.width/2-100, dim.height/2-100);
		
		lblClasse = new JLabel("Classe:");	
		txtClasse = new JTextField(16);

		lblMensagem = new JLabel("Mensagem:");	
		txtMensagem = new JTextField(16);
		
		// Adiciona botões
		btnGravar = new JButton("EXIBIR.");		
		btnGravar.addActionListener(this);
		
		frame.add(lblClasse);
		frame.add(txtClasse);
		frame.add(lblMensagem);
		frame.add(txtMensagem);
		frame.add(btnGravar);	
		
		// Exibe JFrame
		frame.setVisible(true);
	}
	
	// Ação dos botões
	public void actionPerformed(ActionEvent e) {
		
		// Botão gravar
		if(e.getSource() == btnGravar) {	
			JOptionPane.showMessageDialog(null, txtMensagem.getText(), txtClasse.getText(), JOptionPane.INFORMATION_MESSAGE);
		}
	}
}



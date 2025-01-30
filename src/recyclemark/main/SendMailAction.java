package recyclemark.main;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;
import tool.Protocol;


public class SendMailAction extends Action {
	private int port = 587;
	private String host = "smtp-mail.outlook.com";
	private String from = "tky2302053@stu.o-hara.ac.jp";
	private boolean auth = true;
	private String username = "tky2302053@stu.o-hara.ac.jp";
	private String password = "You131115";
//	private Protocol protocol = Protocol.SMTPS;
	private Protocol protocol = Protocol.TLS;
	private boolean debug = true;

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String error = "";
		String forlogin = req.getParameter("forlogin");
		String toDelete = req.getParameter("todelete");
		System.out.println(forlogin);
		System.out.println(toDelete);
		String to = req.getParameter("mail");
		System.out.println(to);
		String subject = "件名（ここは分岐：パスワードリセットメールかパスワード変更かアカウント削除）";

		String body = "http://localhost:8080/recyclemark/recyclemark/main/password_reset.jsp?mail=" + to;
		if (forlogin.equals("1")) {
			subject = "パスワードリセットメール";
			System.out.println(subject);
		} else {
			if (toDelete.equals("1")) {
				subject = "アカウント削除";
				body = "http://localhost:8080/recyclemark/recyclemark/main/delete.jsp?mail=" + to;
				System.out.println(subject);
			} else {
				subject = "パスワード変更";
				System.out.println(subject);
			}
		}

		// Propertiesオブジェクトを作成し、SMTPプロトコル・プロバイダの設定を追加します。
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		switch (protocol) {
		    case SMTPS:
		        props.put("mail.smtp.ssl.enable", true);
		        break;
		    case TLS:
		        props.put("mail.smtp.starttls.enable", true);
		        break;
		}

		// SMTP認証が必要である場合、mail.smtp.authプロパティを設定してAuthenticatorインスタンスを構築し、
		// ユーザー名とパスワードを含んだPasswordAuthenticationインスタンスを返す必要があります。
		Authenticator authenticator = null;
		if (auth) {
		    props.put("mail.smtp.auth", true);
		    authenticator = new Authenticator() {
		        private PasswordAuthentication pa = new PasswordAuthentication(username, password);
		        @Override
		        public PasswordAuthentication getPasswordAuthentication() {
		            return pa;
		        }
		    };
		}

		// PropertiesオブジェクトとAuthenticatorオブジェクトを使用して、Sessionインスタンスを作成します。
		Session session = Session.getInstance(props, authenticator);
		session.setDebug(debug);

		// MimeMessageインスタンスを構築し、メッセージ・ヘッダーとコンテンツを移入したら、メッセージを送信します。
		MimeMessage message = new MimeMessage(session);
		try {
		    message.setFrom(new InternetAddress(from));
		    InternetAddress[] address = {new InternetAddress(to)};
		    message.setRecipients(Message.RecipientType.TO, address);
		    message.setSubject(subject);
		    message.setSentDate(new Date());
		    message.setText(body);
		    Transport.send(message);

		    // ページ遷移
			req.getRequestDispatcher("mail_success.jsp").forward(req, res);
		} catch (MessagingException ex) {
		    ex.printStackTrace();
		    error = "入力されたメールアドレスは存在しません";
			req.setAttribute("error", error);

			// ページ遷移
			req.getRequestDispatcher("reset_mail.jsp").forward(req, res);
		}
	}

}

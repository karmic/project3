package cent285proj3.client;

import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.http.client.Request;
import com.google.gwt.http.client.RequestBuilder;
import com.google.gwt.http.client.RequestCallback;
import com.google.gwt.http.client.Response;
import com.google.gwt.http.client.URL;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.ui.Button;
import com.google.gwt.user.client.ui.HTML;
import com.google.gwt.user.client.ui.Label;
import com.google.gwt.user.client.ui.RootPanel;
import com.google.gwt.user.client.ui.TextBox;
import com.google.gwt.user.client.ui.PasswordTextBox;
import com.google.gwt.user.client.ui.VerticalPanel;
import com.google.gwt.user.client.ui.HorizontalPanel;
import com.google.gwt.user.client.ui.TabPanel;
import com.google.gwt.user.client.ui.Frame;
import com.google.gwt.user.client.ui.FlowPanel;


public class Project3 implements EntryPoint, ClickHandler
	{
		VerticalPanel mainPanel = new VerticalPanel();
		TextBox usernameBox = new TextBox();
		PasswordTextBox passwordBox = new PasswordTextBox();
		Button okButton = new Button("Submit");
		TabPanel tp = new TabPanel();
		//String panel1Data = "";
		
		public void onModuleLoad()
		{
			okButton.addClickHandler(this);
			VerticalPanel inputPanel = new VerticalPanel();
			Label usernameLabel = new Label("Username:");
			HorizontalPanel row1 = new HorizontalPanel();
			row1.add(usernameLabel);
			row1.add(usernameBox);
			inputPanel.add(row1);
			HorizontalPanel row2 = new HorizontalPanel();
			Label passwordLabel = new Label("Password:");
			row2.add(passwordLabel);
			row2.add(passwordBox);
			inputPanel.add(row2);
			inputPanel.add(okButton);
			mainPanel.add(inputPanel);
		}
		public void onClick(ClickEvent event)
		{
			Object source = event.getSource();
			if (source == okButton) {
				String encData = URL.encode("username") + "=" +
					URL.encode(usernameBox.getText()) + "&";
				encData += URL.encode("password") + "=" +
					URL.encode(passwordBox.getText());
				String url = "http://localhost:3000/pages/login";
				postRequest(url,encData);
		}
	}
	private void getRequest(String url)
	{
		final RequestBuilder rb =
			new RequestBuilder(RequestBuilder.GET,url);
		try {
			rb.sendRequest(null, new RequestCallback()
			{
				public void onError(final Request request,
					final Throwable exception)
				{
					Window.alert(exception.getMessage());
				}
				public void onResponseReceived(final Request request,
					final Response response)
				{
					//Window.alert(response.getText());
					//panel1Data = response.getText();
					//FlowPanel panel1 = new FlowPanel();
					//HTML panel1page = new HTML(panel1Data);
					//panel1.add(panel1page);
					//panel1.add(oButton);
					//panel1page.setSize("300px", "300px");
					//TabPanel tp = new TabPanel();
					//tp.add(panel1,"Page1");
					//tp.add(new HTML("Page 2"), "page 2");
					//mainPanel.add(tp);
					Frame frame = new Frame("http://localhost:3000/");
					frame.setWidth("100%");
					frame.setHeight("450px");
					RootPanel.get().add(frame);
				}
			});
		}
		catch (final Exception e) {
			Window.alert(e.getMessage());
		}
	} // end getRequest
	private void postRequest(String url, String data)
	{
		final RequestBuilder rb =
			new RequestBuilder(RequestBuilder.POST,url);
		rb.setHeader("Content-type",
			"application/x-www-form-urlencoded");
		try {
			rb.sendRequest(data, new RequestCallback()
			{
				public void onError(final Request request,
					final Throwable exception)
			{
				Window.alert(exception.getMessage());
			}
			public void onResponseReceived(final Request request,
				final Response response)
			{
				String resp = response.getText().trim();
				int id = Integer.parseInt(resp);
				if (id < 1) {
					usernameBox.setText("");
					passwordBox.setText("");
			}
				else {
					mainPanel.clear();
					//Label status = new Label("id: " + id + " logged in");
					//mainPanel.add(status);
					String url = 
						"http://localhost:3000/user_suggestions/index";
					getRequest(url);
				}
			}
		});
	}
	catch (final Exception e) {
		Window.alert(e.getMessage());
		}
	} // end postRequst
}
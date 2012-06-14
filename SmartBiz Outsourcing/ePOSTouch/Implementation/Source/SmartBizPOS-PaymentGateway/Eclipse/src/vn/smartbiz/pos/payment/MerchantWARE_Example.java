package vn.smartbiz.pos.payment;

import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JSeparator;
import javax.swing.JTextField;
import javax.swing.SwingConstants;
import javax.swing.SwingUtilities;
import javax.swing.UIManager;

import org.dyno.visual.swing.layouts.Constraints;
import org.dyno.visual.swing.layouts.GroupLayout;
import org.dyno.visual.swing.layouts.Leading;

//VS4E -- DO NOT REMOVE THIS LINE!
public class MerchantWARE_Example extends JFrame {

	private static final long serialVersionUID = 1L;
	private JLabel nameLabel;
	private JTextField nameTextField;
	private JLabel siteIdLabel;
	private JTextField siteIdTextField;
	private JLabel keyLabel;
	private JTextField keyTextField;
	private JLabel orderNumberLabel;
	private JTextField orderNumberTextField;
	private JLabel amountLabel;
	private JTextField amountTextField;
	private JLabel panLabel;
	private JTextField panTextField;
	private JLabel expDateLabel;
	private JTextField expDateTextField;
	private JLabel cardHolderLabel;
	private JTextField cardHolderTextField;
	private JLabel avsStreetAddressLabel;
	private JTextField avsStreetAddressTextField;
	private JLabel avsZipCodeLabel;
	private JTextField avsZipCodeTextField;
	private JLabel cvCodeLabel;
	private JTextField cvCodeTextField;
	private JButton issueKeyedSaleButton;
	private JLabel referenceIdLabel;
	private JTextField referenceIdTextField;
	private JLabel outOrderNumberLabel;
	private JTextField outOrderNumberTextField;
	private JLabel txDateLabel;
	private JTextField txDateTextField;
	private JLabel approvalStatusLabel;
	private JTextField approvalStatusTextField;
	private JLabel authCodeLabel;
	private JTextField authCodeTextField;
	private JLabel outCardHolderLabel;
	private JTextField outCardHolderTextField;
	private JLabel outAmountLabel;
	private JTextField outAmountTextField;
	private JLabel typeLabel;
	private JTextField typeTextField;
	private JLabel cardNumberLabel;
	private JTextField cardNumberTextField;
	private JLabel cardTypeLabel;
	private JTextField cardTypeTextField;
	private JLabel avsResponseLabel;
	private JTextField avsResponseTextField;
	private JLabel cvResponseLabel;
	private JTextField cvResponseTextField;
	private JLabel posEntryTypeLabel;
	private JTextField posEntryTypeTextField;
	private JButton issueBatchButton;
	private JLabel txCountLabel;
	private JTextField txCountTextField;
	private JButton issueKeyedRefundButton;
	private JButton issueVoidButton;
	private JLabel referenceCodeLabel;
	private JTextField referenceCodeTextField;
	private JCheckBox allowDuplicatesCheckBox;
	private JSeparator hVoidSeparator;
	private JSeparator vVoidSeparator;
	private JSeparator hFrameSeparator;
	private static final String PREFERRED_LOOK_AND_FEEL = "javax.swing.plaf.metal.MetalLookAndFeel";
	public MerchantWARE_Example() {
		initComponents();
	}

	private void initComponents() {
		setLayout(new GroupLayout());
		add(getNameLabel(), new Constraints(new Leading(19, 10, 10), new Leading(14, 10, 10)));
		add(getNameTextField(), new Constraints(new Leading(19, 168, 10, 10), new Leading(34, 12, 12)));
		add(getSiteIdLabel(), new Constraints(new Leading(202, 10, 10), new Leading(14, 10, 10)));
		add(getSiteIdTextField(), new Constraints(new Leading(202, 145, 10, 10), new Leading(34, 10, 10)));
		add(getKeyLabel(), new Constraints(new Leading(378, 10, 10), new Leading(14, 12, 12)));
		add(getKeyTextField(), new Constraints(new Leading(378, 253, 10, 10), new Leading(34, 10, 10)));
		add(getOrderNumberLabel(), new Constraints(new Leading(19, 10, 10), new Leading(70, 12, 12)));
		add(getOrderNumberTextField(), new Constraints(new Leading(19, 104, 10, 10), new Leading(90, 12, 12)));
		add(getAmountLabel(), new Constraints(new Leading(161, 10, 10), new Leading(70, 12, 12)));
		add(getAmountTextField(), new Constraints(new Leading(161, 101, 10, 10), new Leading(90, 12, 12)));
		add(getPanLabel(), new Constraints(new Leading(301, 10, 10), new Leading(70, 12, 12)));
		add(getPanTextField(), new Constraints(new Leading(301, 205, 10, 10), new Leading(90, 12, 12)));
		add(getExpDateTextField(), new Constraints(new Leading(528, 96, 10, 10), new Leading(90, 12, 12)));
		add(getExpDateLabel(), new Constraints(new Leading(528, 10, 10), new Leading(70, 12, 12)));
		add(getCardHolderLabel(), new Constraints(new Leading(19, 12, 12), new Leading(126, 12, 12)));
		add(getCardHolderTextField(), new Constraints(new Leading(19, 170, 12, 12), new Leading(146, 10, 10)));
		add(getAvsStreetAddressLabel(), new Constraints(new Leading(19, 10, 10), new Leading(182, 10, 10)));
		add(getAvsStreetAddressTextField(), new Constraints(new Leading(19, 220, 10, 10), new Leading(202, 10, 10)));
		add(getAvsZipCodeLabel(), new Constraints(new Leading(281, 10, 10), new Leading(182, 10, 10)));
		add(getAvsZipCodeTextField(), new Constraints(new Leading(282, 144, 10, 10), new Leading(202, 12, 12)));
		add(getCvCodeLabel(), new Constraints(new Leading(19, 12, 12), new Leading(238, 10, 10)));
		add(getCvCodeTextField(), new Constraints(new Leading(19, 123, 10, 10), new Leading(258, 12, 12)));
		add(getIssueKeyedSaleButton(), new Constraints(new Leading(31, 10, 10), new Leading(307, 10, 10)));
		add(getIssueKeyedRefundButton(), new Constraints(new Leading(187, 12, 12), new Leading(307, 12, 12)));
		add(getIssueBatchButton(), new Constraints(new Leading(356, 10, 10), new Leading(307, 12, 12)));
		add(getIssueVoidButton(), new Constraints(new Leading(492, 10, 10), new Leading(307, 12, 12)));
		add(getReferenceIdLabel(), new Constraints(new Leading(19, 12, 12), new Leading(367, 10, 10)));
		add(getReferenceIdTextField(), new Constraints(new Leading(19, 114, 10, 10), new Leading(387, 10, 10)));
		add(getOutOrderNumberLabel(), new Constraints(new Leading(187, 10, 10), new Leading(367, 12, 12)));
		add(getOutOrderNumberTextField(), new Constraints(new Leading(187, 123, 10, 10), new Leading(387, 10, 10)));
		add(getTxDateTextField(), new Constraints(new Leading(351, 129, 10, 10), new Leading(387, 10, 10)));
		add(getTxDateLabel(), new Constraints(new Leading(351, 12, 12), new Leading(367, 12, 12)));
		add(getTxCountLabel(), new Constraints(new Leading(537, 10, 10), new Leading(367, 12, 12)));
		add(getTxCountTextField(), new Constraints(new Leading(537, 80, 10, 10), new Leading(387, 18, 12, 12)));
		add(getApprovalStatusLabel(), new Constraints(new Leading(19, 12, 12), new Leading(423, 10, 10)));
		add(getApprovalStatusTextField(), new Constraints(new Leading(19, 139, 12, 12), new Leading(443, 10, 10)));
		add(getAuthCodeLabel(), new Constraints(new Leading(182, 10, 10), new Leading(423, 12, 12)));
		add(getAuthCodeTextField(), new Constraints(new Leading(181, 131, 10, 10), new Leading(443, 10, 10)));
		add(getOutCardHolderLabel(), new Constraints(new Leading(351, 12, 12), new Leading(423, 12, 12)));
		add(getOutCardHolderTextField(), new Constraints(new Leading(349, 158, 10, 10), new Leading(443, 12, 12)));
		add(getOutAmountLabel(), new Constraints(new Leading(19, 12, 12), new Leading(479, 10, 10)));
		add(getOutAmountTextField(), new Constraints(new Leading(19, 118, 12, 12), new Leading(499, 10, 10)));
		add(getTypeLabel(), new Constraints(new Leading(182, 12, 12), new Leading(479, 12, 12)));
		add(getTypeTextField(), new Constraints(new Leading(182, 86, 12, 12), new Leading(499, 12, 12)));
		add(getCardNumberLabel(), new Constraints(new Leading(310, 10, 10), new Leading(479, 12, 12)));
		add(getCardNumberTextField(), new Constraints(new Leading(310, 236, 12, 12), new Leading(499, 12, 12)));
		add(getCardTypeLabel(), new Constraints(new Leading(19, 12, 12), new Leading(535, 10, 10)));
		add(getCardTypeTextField(), new Constraints(new Leading(19, 127, 10, 10), new Leading(555, 12, 12)));
		add(getAvsResponseLabel(), new Constraints(new Leading(179, 10, 10), new Leading(535, 12, 12)));
		add(getAvsResponseTextField(), new Constraints(new Leading(179, 84, 12, 12), new Leading(555, 10, 10)));
		add(getCvResponseLabel(), new Constraints(new Leading(299, 12, 12), new Leading(535, 12, 12)));
		add(getCvResponseTextField(), new Constraints(new Leading(301, 84, 12, 12), new Leading(555, 10, 10)));
		add(getPosEntryTypeLabel(), new Constraints(new Leading(431, 10, 10), new Leading(535, 12, 12)));
		add(getAllowDuplicatesCheckBox(), new Constraints(new Leading(238, 8, 8), new Leading(261, 8, 8)));
		add(getReferenceCodeTextField(), new Constraints(new Leading(488, 230, 10, 10), new Leading(263, 12, 12)));
		add(getReferenceCodeLabel(), new Constraints(new Leading(490, 10, 10), new Leading(239, 10, 10)));
		add(getHFrameSeparator(), new Constraints(new Leading(12, 701, 10, 10), new Leading(350, 10, 12, 12)));
		add(getVVoidSeparator(), new Constraints(new Leading(475, 238, 12, 12), new Leading(220, 130, 10, 10)));
		add(getHVoidSeparator(), new Constraints(new Leading(475, 238, 12, 12), new Leading(220, 11, 10, 10)));
		add(getPosEntryTypeTextField(), new Constraints(new Leading(479, 118, 12, 12), new Leading(557, 12, 12)));
		setSize(723, 626);
	}

	private JSeparator getHFrameSeparator() {
		if (hFrameSeparator == null) {
			hFrameSeparator = new JSeparator();
			hFrameSeparator.setBorder(BorderFactory.createCompoundBorder(null, null));
		}
		return hFrameSeparator;
	}

	private JSeparator getVVoidSeparator() {
		if (vVoidSeparator == null) {
			vVoidSeparator = new JSeparator();
			vVoidSeparator.setOrientation(SwingConstants.VERTICAL);
		}
		return vVoidSeparator;
	}

	private JSeparator getHVoidSeparator() {
		if (hVoidSeparator == null) {
			hVoidSeparator = new JSeparator();
		}
		return hVoidSeparator;
	}

	private JCheckBox getAllowDuplicatesCheckBox() {
		if (allowDuplicatesCheckBox == null) {
			allowDuplicatesCheckBox = new JCheckBox();
			allowDuplicatesCheckBox.setText("Allow Duplicates");
		}
		return allowDuplicatesCheckBox;
	}

	private JTextField getReferenceCodeTextField() {
		if (referenceCodeTextField == null) {
			referenceCodeTextField = new JTextField();
		}
		return referenceCodeTextField;
	}
	
	public void setReferenceCodeTextField(String text) {
		if (referenceCodeTextField != null) {
			referenceCodeTextField.setText(text);
		}
		return;
	}
	
	private JLabel getReferenceCodeLabel() {
		if (referenceCodeLabel == null) {
			referenceCodeLabel = new JLabel();
			referenceCodeLabel.setText("Reference Code");
		}
		return referenceCodeLabel;
	}

	private JButton getIssueVoidButton() {
		if (issueVoidButton == null) {
			issueVoidButton = new JButton();
			issueVoidButton.setText("Issue Void");
			issueVoidButton.addMouseListener(new MouseAdapter() {
	
				public void mouseClicked(MouseEvent event) {
					issueVoidButtonMouseMouseClicked(event);
				}
			});
		}
		return issueVoidButton;
	}

	private JButton getIssueKeyedRefundButton() {
		if (issueKeyedRefundButton == null) {
			issueKeyedRefundButton = new JButton();
			issueKeyedRefundButton.setText("Issue Keyed Refund");
			issueKeyedRefundButton.addMouseListener(new MouseAdapter() {
	
				public void mouseClicked(MouseEvent event) {
					issueKeyedRefundButtonMouseMouseClicked(event);
				}
			});
		}
		return issueKeyedRefundButton;
	}

	private JTextField getTxCountTextField() {
		if (txCountTextField == null) {
			txCountTextField = new JTextField();
		}
		return txCountTextField;
	}
	
	public void setTxCountTextField(String text) {
		if (txCountTextField != null) {
			txCountTextField.setText(text);
		}
		return;
	}
	
	private JLabel getTxCountLabel() {
		if (txCountLabel == null) {
			txCountLabel = new JLabel();
			txCountLabel.setText("Tx Count");
		}
		return txCountLabel;
	}

	private JButton getIssueBatchButton() {
		if (issueBatchButton == null) {
			issueBatchButton = new JButton();
			issueBatchButton.setText("Issue Batch");
			issueBatchButton.addMouseListener(new MouseAdapter() {
	
				public void mouseClicked(MouseEvent event) {
					issueBatchButtonMouseMouseClicked(event);
				}
			});
		}
		return issueBatchButton;
	}

	private JTextField getPosEntryTypeTextField() {
		if (posEntryTypeTextField == null) {
			posEntryTypeTextField = new JTextField();
		}
		return posEntryTypeTextField;
	}
	
	public void setPosEntryTypeTextField(String text) {
		if (posEntryTypeTextField != null) {
			posEntryTypeTextField.setText(text);
		}
		return;
	}
	
	private JLabel getPosEntryTypeLabel() {
		if (posEntryTypeLabel == null) {
			posEntryTypeLabel = new JLabel();
			posEntryTypeLabel.setText("POS Entry Type");
		}
		return posEntryTypeLabel;
	}

	private JTextField getCvResponseTextField() {
		if (cvResponseTextField == null) {
			cvResponseTextField = new JTextField();
		}
		return cvResponseTextField;
	}
	
	public void setCvResponseTextField(String text) {
		if (cvResponseTextField != null) {
			cvResponseTextField.setText(text);
		}
		return;
	}
	
	private JLabel getCvResponseLabel() {
		if (cvResponseLabel == null) {
			cvResponseLabel = new JLabel();
			cvResponseLabel.setText("CV Response");
		}
		return cvResponseLabel;
	}

	private JTextField getAvsResponseTextField() {
		if (avsResponseTextField == null) {
			avsResponseTextField = new JTextField();
		}
		return avsResponseTextField;
	}
	
	public void setAvsResponseTextField(String text) {
		if (avsResponseTextField != null) {
			avsResponseTextField.setText(text);
		}
		return;
	}
	
	private JLabel getAvsResponseLabel() {
		if (avsResponseLabel == null) {
			avsResponseLabel = new JLabel();
			avsResponseLabel.setText("AVS Response");
		}
		return avsResponseLabel;
	}

	private JTextField getCardTypeTextField() {
		if (cardTypeTextField == null) {
			cardTypeTextField = new JTextField();
		}
		return cardTypeTextField;
	}
	
	public void setCardTypeTextField(String text) {
		if (cardTypeTextField != null) {
			cardTypeTextField.setText(text);
		}
		return;
	}
	
	private JLabel getCardTypeLabel() {
		if (cardTypeLabel == null) {
			cardTypeLabel = new JLabel();
			cardTypeLabel.setText("Card Type");
		}
		return cardTypeLabel;
	}

	private JTextField getCardNumberTextField() {
		if (cardNumberTextField == null) {
			cardNumberTextField = new JTextField();
		}
		return cardNumberTextField;
	}
	
	public void setCardNumberTextField(String text) {
		if (cardNumberTextField != null) {
			cardNumberTextField.setText(text);
		}
		return;
	}
	
	private JLabel getCardNumberLabel() {
		if (cardNumberLabel == null) {
			cardNumberLabel = new JLabel();
			cardNumberLabel.setText("Card Number");
		}
		return cardNumberLabel;
	}

	private JTextField getTypeTextField() {
		if (typeTextField == null) {
			typeTextField = new JTextField();
		}
		return typeTextField;
	}
	
	public void setTypeTextField(String text) {
		if (typeTextField != null) {
			typeTextField.setText(text);
		}
		return;
	}
	
	private JLabel getTypeLabel() {
		if (typeLabel == null) {
			typeLabel = new JLabel();
			typeLabel.setText("Type");
		}
		return typeLabel;
	}

	private JTextField getOutAmountTextField() {
		if (outAmountTextField == null) {
			outAmountTextField = new JTextField();
		}
		return outAmountTextField;
	}
	
	public void setOutAmountTextField(String text) {
		if (outAmountTextField != null) {
			outAmountTextField.setText(text);
		}
		return;
	}
	
	private JLabel getOutAmountLabel() {
		if (outAmountLabel == null) {
			outAmountLabel = new JLabel();
			outAmountLabel.setText("Amount");
		}
		return outAmountLabel;
	}

	private JTextField getOutCardHolderTextField() {
		if (outCardHolderTextField == null) {
			outCardHolderTextField = new JTextField();
		}
		return outCardHolderTextField;
	}
	
	public void setOutCardHolderTextField(String text) {
		if (outCardHolderTextField != null) {
			outCardHolderTextField.setText(text);
		}
		return;
	}

	private JLabel getOutCardHolderLabel() {
		if (outCardHolderLabel == null) {
			outCardHolderLabel = new JLabel();
			outCardHolderLabel.setText("Card Holder");
		}
		return outCardHolderLabel;
	}

	private JTextField getAuthCodeTextField() {
		if (authCodeTextField == null) {
			authCodeTextField = new JTextField();
		}
		return authCodeTextField;
	}
	
	public void setAuthCodeTextField(String text) {
		if (authCodeTextField != null) {
			authCodeTextField.setText(text);
		}
		return;
	}

	private JLabel getAuthCodeLabel() {
		if (authCodeLabel == null) {
			authCodeLabel = new JLabel();
			authCodeLabel.setText("Auth Code");
		}
		return authCodeLabel;
	}

	private JTextField getApprovalStatusTextField() {
		if (approvalStatusTextField == null) {
			approvalStatusTextField = new JTextField();
		}
		return approvalStatusTextField;
	}
	
	public void setApprovalStatusTextField(String text) {
		if (approvalStatusTextField != null) {
			approvalStatusTextField.setText(text);
		}
		return;
	}

	private JLabel getApprovalStatusLabel() {
		if (approvalStatusLabel == null) {
			approvalStatusLabel = new JLabel();
			approvalStatusLabel.setText("Approval Status");
		}
		return approvalStatusLabel;
	}

	private JTextField getTxDateTextField() {
		if (txDateTextField == null) {
			txDateTextField = new JTextField();
		}
		return txDateTextField;
	}
	
	public void setTxDateTextField(String text) {
		if (txDateTextField != null) {
			txDateTextField.setText(text);
		}
		return;
	}

	private JLabel getTxDateLabel() {
		if (txDateLabel == null) {
			txDateLabel = new JLabel();
			txDateLabel.setText("Tx Date");
		}
		return txDateLabel;
	}

	private JTextField getOutOrderNumberTextField() {
		if (outOrderNumberTextField == null) {
			outOrderNumberTextField = new JTextField();
		}
		return outOrderNumberTextField;
	}
	
	public void setOutOrderNumberTextField(String text) {
		if (outOrderNumberTextField != null) {
			outOrderNumberTextField.setText(text);
		}
		return;
	}

	private JLabel getOutOrderNumberLabel() {
		if (outOrderNumberLabel == null) {
			outOrderNumberLabel = new JLabel();
			outOrderNumberLabel.setText("Order Number");
		}
		return outOrderNumberLabel;
	}

	private JTextField getReferenceIdTextField() {
		if (referenceIdTextField == null) {
			referenceIdTextField = new JTextField();
		}
		return referenceIdTextField;
	}
	
	public void setReferenceIdTextField(String text) {
		if (referenceIdTextField != null) {
			referenceIdTextField.setText(text);
		}
		return;
	}

	private JLabel getReferenceIdLabel() {
		if (referenceIdLabel == null) {
			referenceIdLabel = new JLabel();
			referenceIdLabel.setText("Reference ID");
		}
		return referenceIdLabel;
	}

	private JButton getIssueKeyedSaleButton() {
		if (issueKeyedSaleButton == null) {
			issueKeyedSaleButton = new JButton();
			issueKeyedSaleButton.setText("Issue Keyed Sale");
			issueKeyedSaleButton.addMouseListener(new MouseAdapter() {
	
				public void mouseClicked(MouseEvent event) {
					issueKeyedSaleButtonMouseMouseClicked(event);
				}
			});
		}
		return issueKeyedSaleButton;
	}

	private JTextField getCvCodeTextField() {
		if (cvCodeTextField == null) {
			cvCodeTextField = new JTextField();
		}
		return cvCodeTextField;
	}

	private JLabel getCvCodeLabel() {
		if (cvCodeLabel == null) {
			cvCodeLabel = new JLabel();
			cvCodeLabel.setText("CV Code");
		}
		return cvCodeLabel;
	}

	private JTextField getAvsZipCodeTextField() {
		if (avsZipCodeTextField == null) {
			avsZipCodeTextField = new JTextField();
		}
		return avsZipCodeTextField;
	}

	private JLabel getAvsZipCodeLabel() {
		if (avsZipCodeLabel == null) {
			avsZipCodeLabel = new JLabel();
			avsZipCodeLabel.setText("AVS Zip Code");
		}
		return avsZipCodeLabel;
	}

	private JTextField getAvsStreetAddressTextField() {
		if (avsStreetAddressTextField == null) {
			avsStreetAddressTextField = new JTextField();
		}
		return avsStreetAddressTextField;
	}

	private JLabel getAvsStreetAddressLabel() {
		if (avsStreetAddressLabel == null) {
			avsStreetAddressLabel = new JLabel();
			avsStreetAddressLabel.setText("AVS Street Address");
		}
		return avsStreetAddressLabel;
	}

	private JTextField getCardHolderTextField() {
		if (cardHolderTextField == null) {
			cardHolderTextField = new JTextField();
		}
		return cardHolderTextField;
	}

	private JLabel getCardHolderLabel() {
		if (cardHolderLabel == null) {
			cardHolderLabel = new JLabel();
			cardHolderLabel.setText("Card Holder");
		}
		return cardHolderLabel;
	}

	private JTextField getExpDateTextField() {
		if (expDateTextField == null) {
			expDateTextField = new JTextField();
		}
		return expDateTextField;
	}

	private JLabel getExpDateLabel() {
		if (expDateLabel == null) {
			expDateLabel = new JLabel();
			expDateLabel.setText("Exp Date");
		}
		return expDateLabel;
	}

	private JTextField getPanTextField() {
		if (panTextField == null) {
			panTextField = new JTextField();
		}
		return panTextField;
	}

	private JLabel getPanLabel() {
		if (panLabel == null) {
			panLabel = new JLabel();
			panLabel.setText("PAN");
		}
		return panLabel;
	}

	private JTextField getAmountTextField() {
		if (amountTextField == null) {
			amountTextField = new JTextField();
		}
		return amountTextField;
	}

	private JLabel getAmountLabel() {
		if (amountLabel == null) {
			amountLabel = new JLabel();
			amountLabel.setText("Amount");
		}
		return amountLabel;
	}

	private JTextField getOrderNumberTextField() {
		if (orderNumberTextField == null) {
			orderNumberTextField = new JTextField();
		}
		return orderNumberTextField;
	}

	private JLabel getOrderNumberLabel() {
		if (orderNumberLabel == null) {
			orderNumberLabel = new JLabel();
			orderNumberLabel.setText("Order Number");
		}
		return orderNumberLabel;
	}

	private JTextField getKeyTextField() {
		if (keyTextField == null) {
			keyTextField = new JTextField();
		}
		return keyTextField;
	}

	private JLabel getKeyLabel() {
		if (keyLabel == null) {
			keyLabel = new JLabel();
			keyLabel.setText("Key");
		}
		return keyLabel;
	}

	private JTextField getSiteIdTextField() {
		if (siteIdTextField == null) {
			siteIdTextField = new JTextField();
		}
		return siteIdTextField;
	}

	private JLabel getSiteIdLabel() {
		if (siteIdLabel == null) {
			siteIdLabel = new JLabel();
			siteIdLabel.setText("SiteId");
		}
		return siteIdLabel;
	}

	private JTextField getNameTextField() {
		if (nameTextField == null) {
			nameTextField = new JTextField();
		}
		return nameTextField;
	}

	private JLabel getNameLabel() {
		if (nameLabel == null) {
			nameLabel = new JLabel();
			nameLabel.setText("Name");
			nameLabel.setOpaque(true);
		}
		return nameLabel;
	}

	private static void installLnF() {
		try {
			String lnfClassname = PREFERRED_LOOK_AND_FEEL;
			if (lnfClassname == null)
				lnfClassname = UIManager.getCrossPlatformLookAndFeelClassName();
			UIManager.setLookAndFeel(lnfClassname);
		} catch (Exception e) {
			System.err.println("Cannot install " + PREFERRED_LOOK_AND_FEEL
					+ " on this platform:" + e.getMessage());
		}
	}

	/**
	 * Main entry of the class.
	 * Note: This class is only created so that you can easily preview the result at runtime.
	 * It is not expected to be managed by the designer.
	 * You can modify it as you like.
	 */
	public static void main(String[] args) {
		installLnF();
		SwingUtilities.invokeLater(new Runnable() {
			@Override
			public void run() {
				MerchantWARE_Example frame = new MerchantWARE_Example();
				frame.setDefaultCloseOperation(MerchantWARE_Example.EXIT_ON_CLOSE);
				frame.setTitle("vn.smartbiz.pos.payment");
				frame.getContentPane().setPreferredSize(frame.getSize());
				frame.pack();
				frame.setLocationRelativeTo(null);
				frame.setVisible(true);
			}
		});
	}

	private void issueKeyedSaleButtonMouseMouseClicked(MouseEvent event) {
		MerchantWARE_Request merchantWARE_Request = new MerchantWARE_Request(this.getNameTextField().getText(), this.getSiteIdTextField().getText(),
				this.getKeyTextField().getText(), this.getOrderNumberTextField().getText(),
				this.getAmountTextField().getText(), this.getPanTextField().getText(),
				this.getExpDateTextField().getText(), this.getCardHolderTextField().getText(),
				this.getAvsStreetAddressTextField().getText(), this.getAvsZipCodeTextField().getText(),
				this.getCvCodeTextField().getText(), this.getAllowDuplicatesCheckBox().isSelected(),
				this);
		merchantWARE_Request.send();		
	}

	private void issueBatchButtonMouseMouseClicked(MouseEvent event) {
		MerchantWARE_Request merchantWARE_Request = new MerchantWARE_Request(this.getNameTextField().getText(), this.getSiteIdTextField().getText(),
				this.getKeyTextField().getText(), this);
		merchantWARE_Request.send();				
	}

	private void issueKeyedRefundButtonMouseMouseClicked(MouseEvent event) {
		MerchantWARE_Request merchantWARE_Request = new MerchantWARE_Request(this.getNameTextField().getText(), this.getSiteIdTextField().getText(),
				this.getKeyTextField().getText(), this.getOrderNumberTextField().getText(),
				this.getAmountTextField().getText(), this.getPanTextField().getText(),
				this.getExpDateTextField().getText(), this.getCardHolderTextField().getText(),
				this);
		merchantWARE_Request.send();	
	}

	private void issueVoidButtonMouseMouseClicked(MouseEvent event) {
		MerchantWARE_Request merchantWARE_Request = new MerchantWARE_Request(this.getNameTextField().getText(), this.getSiteIdTextField().getText(),
				this.getKeyTextField().getText(), this.getReferenceCodeTextField().getText(), this);
		merchantWARE_Request.send();						
	}

}

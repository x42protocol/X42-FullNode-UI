export class Recipient {
  public DestinationAddress: string = "";
  public Amount: string = "";
}

export class TransactionBuilding {

  constructor(walletName: string, accountName: string, password: string, destinationAddress: string, amount: string, feeType: string, feeAmount: number, allowUnconfirmed: boolean, shuffleOutputs: boolean) {
    this.walletName = walletName;
    this.accountName = accountName;
    this.password = password;

    let recipient: Recipient = new Recipient();
    recipient.DestinationAddress = destinationAddress;
    recipient.Amount = amount;
    this.recipients.push(recipient);
    
    this.amount = amount;
    this.feeType = feeType;
    this.feeAmount = feeAmount;
    this.allowUnconfirmed = allowUnconfirmed;
    this.shuffleOutputs = shuffleOutputs;
  }

  walletName: string;
  accountName: string;
  password: string;
  recipients: Array<Recipient> = [];
  amount: string;
  feeType: string;
  feeAmount: number;
  allowUnconfirmed: boolean;
  shuffleOutputs: boolean;
}

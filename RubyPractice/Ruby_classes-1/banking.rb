#Daniel Burnette MakerSquare Technical Interview Banking Challenge
class Person

	attr_accessor :name
	attr_accessor :accountsAndAmounts
	attr_accessor :cash
	attr_accessor :CCDebt

	def initialize(name, cash)
		@name = name
		@cash = cash
		@accountsAndAmounts = {}
		@CCDebt = {}
		puts "Hi, #{@name}. You have $#{@cash}!"
	end

	#Credit card
	def charge_CC(bank, amt)
		prevCardBalance = @CCDebt[bank.bankName]
		@CCDebt.store(bank.bankName, amt + prevCardBalance)
		puts "#{@name} has charged #{amt} to his #{bank.bankName} credit card. He/She now owes #{@CCDebt[bank.bankName]} on that card."
	end

	def payoff_CC(bank, amt)
		if (@cash > amt)
			prevCardBalance = @CCDebt[bank.bankName]
			@CCDebt.store(bank.bankName, prevCardBalance - amt)
			@cash = @cash - amt
			puts "#{@name} has paid off #{amt} on his #{bank.bankName} credit card. He/She now owes #{@CCDebt[bank.bankName]} on that card. #{@name} has $#{@cash} cash."
		else
			puts "#{@name} does not have enough cash to pay that amount off his credit card."
		end
	end

end


class Bank

	attr_accessor :bankName

	def initialize(bankName)
		@bankName = bankName
		@accountHolders = []
		@CCHolders = []
		puts "#{@bankName} bank was just created."
	end

	def open_account(person)
		puts "#{person.name}, thanks for opening an account at #{@bankName}!"
		person.accountsAndAmounts.store(@bankName, 0)
		@accountHolders.push(person)
	end

	def withdraw(person, amt)
		amtInBank = person.accountsAndAmounts[@bankName]
		if (amtInBank - amt >= 0)
			person.accountsAndAmounts.store(@bankName, amtInBank - amt)
			person.cash = person.cash + amt
			puts "#{person.name} withdrew $#{amt} from #{@bankName}. #{person.name} has $#{person.cash}. #{person.name}'s account has $#{amtInBank - amt}"
		else 
			puts "#{person.name} does not have enough money in the account to withdraw $#{amt}"
		end
	end

	def deposit(person, amt)
		amtInBank = person.accountsAndAmounts[@bankName]
		if (person.cash >= amt)
			person.accountsAndAmounts.store(@bankName, amtInBank + amt)
			person.cash = person.cash - amt
			puts "#{person.name} deposited $#{amt} to #{@bankName}. #{person.name} has $#{person.cash}. #{person.name}'s account has $#{amtInBank + amt}"
		else
			puts "#{person.name} does not have enough cash to deposit $#{amt}."
		end
	end

	def transfer(person, transferTo, amt)
		newBalance = person.accountsAndAmounts[@bankName] - amt
		person.accountsAndAmounts.store(@bankName, newBalance)

		transferAccountBalance = person.accountsAndAmounts[transferTo.bankName] + amt
		person.accountsAndAmounts.store(transferTo.bankName, transferAccountBalance)

		puts "#{person.name} transferred $#{amt} from the #{@bankName} account to the #{transferTo.bankName} account. The #{@bankName} account has $#{newBalance} and the #{transferTo.bankName} account has $#{transferAccountBalance} "

	end

	def total_cash_in_bank
		totalCash = 0
		@accountHolders.each do |person|
			amtInAccount = person.accountsAndAmounts[@bankName]
			totalCash = totalCash + amtInAccount
		end
		"#{@bankName} has $#{totalCash} in the bank"
	end

	def issue_CC (person)
		@CCHolders.push(person)
		person.CCDebt.store(@bankName, 0)
		puts "#{person.name} has opened a credit card at #{@bankName}."
	end

end

#test code
chase = Bank.new("JP Morgan Chase")
wells_fargo = Bank.new("Wells Fargo")
me = Person.new("Shehzan", 500)
friend1 = Person.new("John", 1000)
chase.open_account(me)
chase.open_account(friend1)
wells_fargo.open_account(me)
wells_fargo.open_account(friend1)

#Withdrawing and depositing
chase.deposit(me, 200)
chase.deposit(friend1, 300)
chase.withdraw(me, 50)

#Transfers
chase.transfer(me, wells_fargo, 100)

#Extra Credit Challenges
chase.deposit(me, 5000)
chase.withdraw(me, 5000)
puts chase.total_cash_in_bank
puts wells_fargo.total_cash_in_bank

#Credit card tests
chase.issue_CC(me)
wells_fargo.issue_CC(me)

me.charge_CC(chase, 100)
me.charge_CC(wells_fargo, 200)
me.charge_CC(chase, 200)
me.charge_CC(wells_fargo, 300)
#Should be 300 on chase CC, 500 on wells_fargo CC at this point

me.payoff_CC(chase, 300)
#Shezan should have $50 left

me.payoff_CC(wells_fargo, 500)
#Should not work because Shezhan only has $50



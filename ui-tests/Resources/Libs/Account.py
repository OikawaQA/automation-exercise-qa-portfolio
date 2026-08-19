from faker import Faker

fake = Faker('pt_BR')


def get_fake_account():
    
    
    account = {
        "Name": fake.name(),
        "Email": fake.email(),
        "Company": fake.company(),
        "Last_Name": fake.last_name(),
        "Address": fake.address(),
        "Message": fake.text()
    }
    return account
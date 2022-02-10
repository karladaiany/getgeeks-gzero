

def factory_new_user():

    return {
        'name': 'Clint Barton',
        'email': 'barton@shield.com',
        'password': 'pwd123'
    }
    
def factory_get_user():

    return {
        'name': 'Gwen Stacy',
        'email': 'stacy@ozcorp.com',
        'password': 'pwd123'
    }

def factory_remove_user():

    return {
        'name': 'Thaddeus Ross',
        'email': 'ross@gmail.com',
        'password': 'pwd123'
    }

def factory_update_user():

    email = 'karla@qaninja.com.br'
    
    return {
        'before': {
            'name': 'Oliveira Karla',
            'email': email,
            'password': 'pwd123'
        },
        'after': {            
            'name': 'Karla Oliveira',
            'email': email,
            'whatsapp': '459999999991',
            'avatar': 'https://avatars.githubusercontent.com/u/88800202'
        }
    }

def factory_user_session(target):

    name = 'Kate Bishop'
    email = 'kate@hotmail.com'
    password = 'pwd123'

    data = {
        'signup': {
            'name': name,
            'email': email,
            'password': password
        },
        'login': {
            'email': email,
            'password': password
        }
    }

    return data[target]
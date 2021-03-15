enum Value { email, name, phoneNumber, address }

String isValid(String text, Value value) {
  Map<Value, Map<String, dynamic>> pattern = {
    Value.email: {
      'regex': new RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}'),
      'message': 'Invalid email'
    },
    Value.name: {
      'regex': new RegExp(r'^[a-zA-Z]+(([,. -][a-zA-Z ])?[a-zA-Z]*)*$'),
      'message': 'Invalid name'
    },
    Value.phoneNumber: {
      'regex': new RegExp(r'^[0-9]{10}$'),
      'message': 'Invalid phone number'
    },
    Value.address: {
      'regex': new RegExp(r'^[#.0-9a-zA-Z\s,-]{5,200}$'),
      'message': 'Invalid address'
    },
  };
  return pattern[value]['regex'].hasMatch(text)
      ? null
      : pattern[value]['message'];
}

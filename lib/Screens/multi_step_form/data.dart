String jsonString = '''
{
  "steps": [
    {
      "fields": [
        {
          "type": "text",
          "label": "First Name",
          "key": "firstName",
          "required": true
        },
        {
          "type": "text",
          "label": "Last Name",
          "key": "lastName",
          "required": true
        }
      ]
    },
    {
      "fields": [
        {
          "type": "email",
          "label": "Email",
          "key": "email",
          "required": true
        },
        {
          "type": "phone",
          "label": "Phone Number",
          "key": "phoneNumber",
          "required": true
        }
      ]
    },
    {
      "fields": [
        {
          "type": "password",
          "label": "Password",
          "key": "password",
          "required": true
        },
        {
          "type": "password",
          "label": "Confirm Password",
          "key": "confirmPassword",
          "required": true
        }
      ]
    }
  ]
}
''';
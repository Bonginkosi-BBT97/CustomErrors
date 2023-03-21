import Foundation

enum BoboError: LocalizedError {

    case invalidEmail
    case invalidPhone
    case invalidName

    var errorDescription: String? {
        switch self {
        case .invalidEmail:
            return "Email is invalid"
        case .invalidPhone:
            return "Please enter a valid phone number of 10 digits"
        case .invalidName:
            return "Please enter at least two names"
        }
    }
}

func isValidName (_ name: String) throws {
    let words = name.components(separatedBy: .whitespaces)
    if words.count < 2 {
        throw BoboError.invalidName
    }

}
func isValidPhone (_ phone: String) throws {
    if !(phone.count == 10) {
        throw BoboError.invalidPhone
    }
}
func isValidEmail(_ email: String) throws {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)

    if !emailPred.evaluate(with: email) {
        throw BoboError.invalidEmail
    }
}

func isValidForm(email: String, phone: String, name: String) {
    do {
        try isValidEmail(email)
        try isValidPhone(phone)
        try isValidName(name)
        print("Everything is correct")
    } catch {
        print(error.localizedDescription)
    }

}

isValidForm(email: "test@bobo.com", phone: "1234567891", name: "Bobo Tshabalala")

import UIKit

/// 01
func greetUser() {
    print("01: Hi there!")
}

greetUser()

var greetCopy = greetUser   // greetCopy is now a funtion () -> Void - We are taking a copy of the funtion greetUser
print(greetCopy)
greetCopy()

///
print("\n")

/// 02
func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "02: Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

///
print("\n")

/// 03

// CoopManageCardCoordinator
// CoopManageVBVPasswordCoordinator
// PasswordUpdateSuccessCoordinator
// CoopUpdateMobileNumberCoordinator

{
  "Value": "Enter a mobile number that starts with 07",
class CoopUpdateMobileNumberViewModelTests:
  "key": "i18.common.manage_card.mobile_number_starting_error.text"
},
case .i18ManageCardMobileNumberStartingErrorText:   // UNUSED
public class CoopUpdateMobileNumberViewModel:       // "i18n" KEY Used

{
  "Value": "Update the mobile number for the additional cardholder",
class CoopUpdateMobileNumberViewModelTests:
  "key": "i18.common.manage_card.update_mobile.header_title.text"
},
case .i18ManageCardUpdateMobileHeaderTitleText:     // UNUSED
public class CoopUpdateMobileNumberViewModel:       // "i18n" KEY Used



{
  "Value": "Mobile number",
  "key": "i18.common.manage_card.mobile_number.text"
},
case .i18ManageCardMobileNumberText:
class UpdatePhoneNumbersViewModelTests:
class UpdatePhoneNumbersAssets
struct CoopPersonalDetailsAssets

{
  "Value": "Mobile numbers must be 11 digits",
  "key": "i18.common.manage_card.mobile_number_length_error.text"
},
case .i18ManageCardMobileNumberLengthErrorText:
class UpdatePhoneNumbersViewModelTests:
class UpdatePhoneNumbersAssets
public class CoopUpdateMobileNumberViewModel:       // "i18n" KEY Used



    func getTitle() -> NSAttributedString {
        let labelAttributedString = NSMutableAttributedString()
        let labelString = assets.noUsernamePasswordLabelText
        
        guard let commaIndex = labelString.firstIndex(of: ",")?.utf16Offset(in: labelAttributedString.string) else {
            return NSAttributedString()
            
        }
    
        // If there is no comma in the string - ruturn the whole thing in bold
        guard let commaIndex = labelString.firstIndex(of: ",")?.utf16Offset(in: labelString) else {
            return labelString.coopStyleAttributedString(lineHeight: 1.18, font: Fonts.shared.font(forTextStyle: .subheadline))
        }
        
        // Otherwise it should return the portion of the string before the comma in bold and the rest in normal text
        let firstSubstring = "\(labelString[..<commaIndex])"
        labelAttributedString.append(firstSubstring.coopStyleAttributedString(lineHeight: 1.18, font: Fonts.shared.font(forTextStyle: .subheadline)))
        let secondSubstring = "\(labelString[commaIndex...])"
        labelAttributedString.append(secondSubstring.coopStyleAttributedString(lineHeight: 1.18, font: Fonts.shared.font(forTextStyle: .caption2)))
        return labelAttributedString
    }

typealias Completion = (Result<SuccessResult<Data?>, NetworkServiceError>) -> Void
typealias Completion = (Result<(data: Data?, httpUrlResponse: HTTPURLResponse), NetworkServiceError>) -> Void

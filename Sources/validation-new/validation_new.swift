import SwiftUI
import CoreData
import CoreLocation
import Combine
@available(iOS 14, macOS 11.0, *)
 public struct validation_new {
     @Binding var pincode: String
        public init(pincode: Binding<String>) {
         getloc(pincode:pincode)
             //self._pincode = pincode
          
         }
    //  func Validation() -> String? {
    //     if self.name.count == 0 {
    //         errormsg = "Enter Correct UserName"
    //     }
    //     else  if  !self.isValiphoneNumber(phoneNumber) {
    //         errormsg = "Enter correct phone number"
    //     }
    //     else  if  !self.isValidEmail(email) {
    //         errormsg =  "Enter Correct Email"
            
    //     }
    //     else if  pincode.count != 6  && self.pincode.count > 0 {
    //         errormsg = "Enter Correct PINCODE"
            
    //     }
    //     else if pincode.count == 6  && pincode.count != 0 {
    //         self.getloc()
    //         errormsg = "Form Submitted Successfully"
    //     }
    //     else {
    //         errormsg = ""
    //     }
    //     return errormsg
    // }
    
     func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
        
    }
    //  func isValiphoneNumber(_ phoneNumber: String) -> Bool {
    //     let phoneNumberRegEx = "^\\d{3}\\d{3}\\d{4}$"
    //     let phoneNumberPred = NSPredicate(format:"SELF MATCHES %@", phoneNumberRegEx)
    //     return phoneNumberPred.evaluate(with: phoneNumber)
    // }
    
    // func limitUserName(_ upper: Int) {
    //     if name.count > upper {
    //         name = String(name.prefix(upper))
    //     }
    // }
    
    // func limitPhoneNo(_ upper: Int) {
    //     if phoneNumber.count > upper {
    //         phoneNumber = String(phoneNumber.prefix(upper))
    //     }
    // }
    
    // func limitPincode(_ upper: Int) {
    //     if pincode.count > upper {
    //         pincode = String(pincode.prefix(upper))
    //     }
    // }
     func getloc(pincode:String) {
          var cityName = ""
        let location: String = pincode
        let geocoder: CLGeocoder = CLGeocoder()
        geocoder.geocodeAddressString(location, completionHandler: {(placemarks: [CLPlacemark]?, error: Error?) -> Void in
            if ((placemarks?.count)! > 0) {
                let placemark: CLPlacemark = (placemarks?[0])!
                
                cityName = placemark.locality!
                
                let cityName = { (cityName: String) -> String in
                    return "I'm going to \(cityName) in my car"
                }
            //    return <cityName>
              //  print(cityName)
            }
        } )
    }
}





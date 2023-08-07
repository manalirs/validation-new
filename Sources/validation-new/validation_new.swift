

import SwiftUI
import CoreData
import CoreLocation
import Combine
@available(iOS 15.0, *)
public class validation_new {
      @State var showingAlert = false
      var errormsg = ""
       public func buttonubmit(name: String,pincode:String,phoneNumber:String,email:String)()-> some View{
                   Button("Submit") {
                    errormsg = Validation(name:name,pincode:pincode,phoneNumber:phoneNumber,email:email)!
                    showingAlert = true
                }
                .alert(errormsg, isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { }
                }
                .font(.largeTitle)
         
            .frame(width: 200, height: 25, alignment: .center)
            .padding(.all)
            .foregroundColor(.black)
            .cornerRadius(22)
     //       .font(.largeTitle).fontWeight(.medium)
            .background(Color.yellow)
            }
    
 //     var errormsg = ""
    public init() {}
     public func Validation(name: String,pincode:String,phoneNumber:String,email:String) -> String? {      
         let errorMessage = String()
                // if let errorMessage = Validation(name: name, pincode: pincode) {
                //     print(errorMessage)
                //     return
                // }
                
        if name.count == 0 {
            errormsg = "Enter Correct UserName"
        }
        else  if  !isValiphoneNumber(phoneNumber){
            errormsg = "Enter correct phone number"
        }
        else  if !isValidEmail(email) {
            errormsg =  "Enter Correct Email"

        }
        else if  pincode.count != 6 {
            errormsg = "Enter Correct PINCODE"
            
        }
        else if pincode.count == 6  && pincode.count != 0 {
     
             getloc(pincode: pincode)
             let cityName = UserDefaults.standard.string(forKey: "cityName")!
                print("city--\(cityName )")
            errormsg = "Form Submitted Successfully"
        }
        else {
            errormsg = ""
        }
        return errormsg
    }
    
      public func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
  
    public func isValiphoneNumber(_ phoneNumber: String) -> Bool {
        let phoneNumberRegEx = "^\\d{3}\\d{3}\\d{4}$"
        let phoneNumberPred = NSPredicate(format:"SELF MATCHES %@", phoneNumberRegEx)
        return phoneNumberPred.evaluate(with: phoneNumber)
    }
  
   public func limitUserName(_ upper: Int,name: String)-> String {
     var name1: String = ""
        if name.count > upper {
            name1 = String(name.prefix(upper))
        }
    print("name1--\(name)")
    return name1
    }
    
    // func limitPhoneNo(_ upper: Int) {
    //     if phoneNumber.count > upper {
    //         phoneNumber = String(phoneNumber.prefix(upper))
    //     }
    // }
    
    // func limitPincode(_ upper: Int) {
    //     if pincode.count > upper {
    //         pincode = String(pincode.prefix(upper))
    //     }
  //}
  
   
   public func getloc(pincode: String) {
            var cityName = ""
            let location: String = pincode
            let geocoder: CLGeocoder = CLGeocoder()
            geocoder.geocodeAddressString(location, completionHandler: {(placemarks: [CLPlacemark]?, error: Error?) -> Void in
                if ((placemarks?.count)! > 0) {
                    let placemark: CLPlacemark = (placemarks?[0])!
                    
                    cityName = placemark.locality!
                    UserDefaults.standard.set(cityName, forKey: "cityName")
                
                }
            } )
        }
 

}
      @available(iOS 15.0, *)
      extension View {
     
  public func vv()-> some View {
         
  frame(width: 200, height: 30, alignment: .center)
              .textFieldStyle(RoundedBorderTextFieldStyle()) .font(Font.system(size: 20))
                 .padding(.all)
         
        
  }
     
}




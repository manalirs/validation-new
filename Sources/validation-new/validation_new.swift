import SwiftUI
import CoreData
import CoreLocation
import Combine
//@available(iOS 14, macOS 11.0, *)
 public class validation_new {
   
        public init() {}
   var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("Personal Details").font(.largeTitle).fontWeight(.medium)
                    .multilineTextAlignment(.center)
                HStack {
                    Text("Name :")
                    Spacer()
                    Spacer()
                    TextField("Enter username", text: $name)
                        .frame(width: 200, height: 30, alignment: .trailing)
                        .textFieldStyle(RoundedBorderTextFieldStyle()) .font(Font.system(size: 20))
                        .onReceive(Just(name)) { _ in let u = validation_new().limitUserName(UserNameLimit, name: name) }
                        .padding(.all)
                        .focused($isTextFieldFocused)
                }
                HStack {
                    Text("Phone Number :")
                    Spacer()
                    TextField("Enter phoneNumber", text: $phoneNumber)
                        .frame(width: 200, height: 30, alignment: .trailing)
                        .textFieldStyle(RoundedBorderTextFieldStyle()) .font(Font.system(size: 20))
                        .padding(.all)
                        .keyboardType(.numberPad)
                        .focused($isTextFieldFocused)
                        .onReceive(Just(phoneNumber)) { _ in limitPhoneNo(phonenolimit) }
                        .onChange(of: isTextFieldFocused) { yes in
                            if !validation_new().isValiphoneNumber(phoneNumber) && !self.phoneNumber.isEmpty{
                                errormsg = "Enter correct phone number"
                            }
                            else
                            {
                                errormsg = ""
                            }
                        }
                }
                HStack {
                    Text("Email :")
                    Spacer()
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle()) .font(Font.system(size: 20))
                        .frame(width: 200, height: 30, alignment: .trailing)
                        .padding(.all)
                        . focused($isTextFieldFocused)
                        .onChange(of: isTextFieldFocused){ new in
                            
                            if !validation_new().isValidEmail(email)  {
                                errormsg =  "Enter Correct Email"
                            }
                            else {
                                errormsg = ""
                            }
                            
                        }
                        .autocapitalization(.none)
                }
                
                HStack {
                    Text("Address :")
                    Spacer()
                    TextField("Flat no/Building :", text: $address)
                        .frame(width: 200, height: 30, alignment: .trailing)
                        .textFieldStyle(RoundedBorderTextFieldStyle()) .font(Font.system(size: 20))
                        .padding(.all)
                        .focused($isTextFieldFocused)
                    
                }
                HStack {
                    Spacer()
                    TextField("Street Name :", text: $streetName)
                        .frame(width: 200, height: 30, alignment: .trailing)
                        .textFieldStyle(RoundedBorderTextFieldStyle()) .font(Font.system(size: 20))
                        .padding(.all)
                        .focused($isTextFieldFocused)
                    
                }
                HStack {
                    Spacer()
                    TextField("Landmark :", text: $landmark)
                        .frame(width: 200, height: 30, alignment: .trailing)
                        .textFieldStyle(RoundedBorderTextFieldStyle()) .font(Font.system(size: 20))
                        .padding(.all)
                        .focused($isTextFieldFocused)
                    
                }
                HStack {
                    Text("PinCode :")
                    Spacer()
                    TextField("Enter PinCode", text: $pincode)
                        .frame(width: 200, height: 30, alignment: .trailing)
                        .textFieldStyle(RoundedBorderTextFieldStyle()) .font(Font.system(size: 20))
                        .padding(.all)
                        .keyboardType(.numberPad)
                        .onReceive(Just(pincode)) { _ in limitPincode(pincodeLimit) }
                        . focused($isTextFieldFocused)
                        .onChange(of: isTextFieldFocused) { new in
                            if pincode.count == 6 || !pincode.isEmpty {
                                _ = validation_new().getloc(pincode: pincode)
                               cityName = UserDefaults.standard.string(forKey: "cityName")!
                                print("city--\(cityName )")
                                errormsg = ""
                            }
                            else {
                                errormsg = "Enter Correct PINCODE"
                            }
                        }
                }
                HStack {
                    Text("City :")
                    Spacer()
                    TextField(cityName, text: $cityName)
                        .frame(width: 200, height: 30, alignment: .trailing)
                        .textFieldStyle(RoundedBorderTextFieldStyle()) .font(Font.system(size: 20))
                        .padding(.all)
                        .disabled(true)
                }
            }
            .textFieldStyle(RoundedBorderTextFieldStyle()) .font(Font.system(size: 20))
            .textContentType(.emailAddress)
            .padding(.all)
            Text(errormsg)
            Button(action: {
            
                // if let errorMessage = self.Validation() {
                //     print(errorMessage)
                //     return
                // }
                
            })  {
                Text("Submit").font(.largeTitle).fontWeight(.medium)
                    .frame(width: 200, height: 25, alignment: .center)
                    .padding(.all)
                    .foregroundColor(.black)
                    .cornerRadius(22)
            } .background(Color.yellow)
                .cornerRadius(22)
            Spacer()
            
        }
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





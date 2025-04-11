# That's a temporary user model without encrypted fields
# to allow encrypting existing data,
# after running EncryptSecurityQuestionsAndRecoveryCodes this model can be removed
class UserWithoutEncryption < ApplicationRecord
  self.table_name = 'users'
end

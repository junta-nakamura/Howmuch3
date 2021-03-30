class BusinessType < ActiveHash::Base
  self.data = [
    {id: 1, name: 'BtoB'},
    {id: 2, name: 'BtoC'},
    {id: 3, name: 'CtoC'}
  ]
end
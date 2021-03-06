# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# item
Item.destroy_all

Item.create(name: 'widor01', attachments: 'LANケーブル,充電器', lending_period: 10, category: 1, place: '1909前の棚', amount: 1, trashed: false)
Item.create(name: 'widor02', attachments: 'LANケーブル,充電器', lending_period: 10, category: 1, place: '1909前の棚', amount: 1, trashed: false)
Item.create(name: 'roomba1', attachments: '充電器', lending_period: 1, category: 0, place: '1909前の棚', amount: 3, trashed: false)


# user
User.destroy_all

User.create(name: '高松太郎', uid: 'takamatsu', admin_flag: true, category: 0, lendable: true, e_mail: 's00t000', password: 'password', password_confirmation: 'password')
User.create(name: '香川太郎', uid: 'kagawa', admin_flag: true, category: 1, lendable: true, e_mail: 's00t001', password: 'password', password_confirmation: 'password')
User.create(name: '香川花子', uid: 'kagahana', admin_flag: false, category: 0, lendable: true, e_mail: 's00t002', password: 'password', password_confirmation: 'password')
User.create(name: '高松花子', uid: 'takahana', admin_flag: false, category: 0, lendable: true, e_mail: 's00t003', password: 'password', password_confirmation: 'password')

# history
History.destroy_all

# History.create(id: 1, user_id: 1, item_id: 1, status: 0, amount: 1, detail: 'なし', created_at: Time.now - 10.days)
# History.create(id: 2,user_id: 1, item_id: 1, status: 1, amount: 1, detail: 'なし', created_at: Time.now - 9.days)
# History.create(id: 3, user_id: 2, item_id: 2, status: 0, amount: 1, detail: 'なし', created_at: Time.now - 8.days)
# History.create(id: 4, user_id: 2, item_id: 2, status: 1, amount: 1, detail: 'なし', created_at: Time.now - 7.days)
# History.create(id: 5, user_id: 1, item_id: 1, status: 0, amount: 1, detail: 'なし', created_at: Time.now - 4.days)
# History.create(id: 6, user_id: 1, item_id: 2, status: 0, amount: 1, detail: 'なし', created_at: Time.now - 5.days)
# History.create(id: 7, user_id: 1, item_id: 3, status: 2, amount: 1, detail: 'なし', created_at: Time.now)
# History.create(id: 8, user_id: 2, item_id: 2, status: 2, amount: 1, detail: 'なし', created_at: Time.now)

History.create(user_id: 1, item_id: 1, type: 'LendHistory', amount: 1, detail: 'なし', created_at: Time.now - 10.days)
History.create(user_id: 1, item_id: 1, type: 'ReturnHistory', amount: 1, detail: 'なし', created_at: Time.now - 9.days)
History.create(user_id: 2, item_id: 2, type: 'LendHistory', amount: 1, detail: 'なし', created_at: Time.now - 8.days)
History.create(user_id: 2, item_id: 2, type: 'ReturnHistory', amount: 1, detail: 'なし', created_at: Time.now - 7.days)
History.create(user_id: 1, item_id: 1, type: 'LendHistory', amount: 1, detail: 'なし', created_at: Time.now - 4.days)
History.create(user_id: 1, item_id: 2, type: 'LendHistory', amount: 1, detail: 'なし', created_at: Time.now - 5.days)
History.create(user_id: 1, item_id: 3, type: 'ReserveHistory', amount: 1, detail: 'なし', created_at: Time.now, start_date: Time.now + 10.days)
History.create(user_id: 2, item_id: 2, type: 'ReserveHistory', amount: 1, detail: 'なし', created_at: Time.now, start_date: Time.now + 10.days)


# message
Message.destroy_all

Message.create(contents: 'ほげほげ', from: "管理者", read_flag: true, user_id: 1)
Message.create(contents: 'aa', from: "システム", read_flag: false, user_id: 1)

# reservation
Reservation.destroy_all


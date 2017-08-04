#データベース設計

__users table__

|  column  |   type  | Options |
|   ---    |   ---   |   ---   |
|  name    | string  | index: true, null: false, unique: true|

_Association_
has_many :messages
has_many :groups_users
has_many :groups, through: group_users



__messages table__

|  column  |   type  | Options|
|:--------:|:-------:|:-------:|
|  body    |   text  ||
|  image   | string  ||
| group_id | references |foreign_key: true|
| user_id  | references |foreign_key: true|

_Association_
belongs_to :user
belongs_to :group




__groups table__

|  column  |   type  | Options |
|:--------:|:-------:|:-------:|
|   name   | string  | unique: true|

_Association_
has_many :groups_users
has_many :users,through:groups_users
has_many :messages



__groups_users table__

|  column  |   type  | Options|
|:--------:|:-------:|:-------:|
| group_id | references |null: false,foreign_key: true|
|  user_id | references |null: false,foreign_key: true|



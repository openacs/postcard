-- electronic postcard
create sequence postcard_seq;
create sequence postcard_image_seq;

create table postcard_images (
  card_image_id integer primary key,
  image         oid not null,
  mime_type     varchar(100),
  title         varchar(1000),
  description   varchar(4000)
);

create table postcards (
  card_id      integer primary key,
  card_picture references postcard_images,
  recipient    varchar(1000),
  sender       varchar(1000),
  message      varchar(4000),
  pickup_code  varchar(1000),
  picked_up date
);



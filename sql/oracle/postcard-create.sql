-- electronic postcard
create sequence postcard_seq;
create sequence postcard_image_seq;

create table postcard_images (
  card_image_id integer primary key,
  image         blob default empty_blob(),
  mime_type     varchar2(100),
  title         varchar2(1000),
  description   varchar2(4000)
);

create table postcards (
  card_id      integer primary key,
  card_picture references postcard_images,
  recipient    varchar2(1000),
  sender       varchar2(1000),
  message      varchar2(4000),
  pickup_code  varchar2(1000),
  picked_up date
);



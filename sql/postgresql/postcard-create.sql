-- electronic postcard

/* basic data model

this needs to get migrated to the content-repository

for now the original data model is utilized.

*/

create sequence postcard_seq;
create view postcard_sequence as
	select nextval('postcard_seq');
	
create sequence postcard_image_seq;
create view postcard_image_sequence as
	select nextval('postcard_image_seq');

create table postcard_images (
  card_image_id integer primary key,
  lob         integer references lobs,
  mime_type     varchar(100),
  title         varchar(1000),
  description   text
);

-- to enable pg lob support see kernel/sql/postgresql/lobs.sql
create trigger postcard_images_lob_trigger before delete or update or insert
on postcard_images for each row execute procedure on_lob_ref();

create table postcards (
  card_id      integer primary key,
  card_picture integer references postcard_images,
  recipient    varchar(1000),
  sender       varchar(1000),
  message      text,
  pickup_code  varchar(1000),
  picked_up    date 
); 






-- electronic postcard


/* first we create the permissions model for postcards

  defining these basic actions
   
  - upload images
  - view postcard
  - moderate images
  - create card to send

  and then define the base security privileges that we
  want to have. applications that want to designate
  to the end user fine grained permission control, should 
  designate appropiate basic privileges as the atomic level
  of an applications/services security.

*/ 
begin;

 select acs_privilege__create_privilege('postcard_create_image',null,null);
 select acs_privilege__create_privilege('postcard_create_card',null,null);
 select acs_privilege__create_privilege('postcard_read',null,null);
 select acs_privilege__create_privilege('postcard_admin',null,null);


 -- bind privileges to privilege heirarchy

 select acs_privilege__add_child('create', 'postcard_create_image');
 select acs_privilege__add_child('create', 'postcard_create_card');
 select acs_privilege__add_child('read', 'postcard_read');

 select acs_privilege__add_child('admin','postcard_admin');
end;


/* 
   Creating permissions basically involves binding the
   privilege to the object system.

   permissions involve binding a particular privilege
   to a user in a given context.

   We grant the permissions to the public

   inline function - inline funcs are used to allow 
   calling pl/pgsql.
*/
 
create function inline_0 ()
returns integer as '
declare
    default_context integer;
    registered_users integer;
    the_public integer;
begin

    default_context := acs__magic_object_id(''default_context'');
    registered_users := acs__magic_object_id(''registered_users'');
    the_public := acs__magic_object_id(''the_public'');

    -- give registered users the power to post by default

    perform acs_permission__grant_permission (
        default_context,
        registered_users,
        ''postcard_create_card''
    );

    perform acs_permission__grant_permission (
        default_context,
        registered_users,
        ''postcard_create_image''
    );

    -- give the public the power to read by default

    perform acs_permission__grant_permission (
        default_context,
        the_public,
        ''postcard_read''
    );

    return 0;
end;
' language 'plpgsql';

select inline_0 ();
drop function inline_0 ();

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






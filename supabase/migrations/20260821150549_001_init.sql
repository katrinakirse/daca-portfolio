create sequence "public"."customers_id_seq" as integer increment by 1 minvalue 1 maxvalue 2147483647 START with 1 cache 1 no cycle;
create sequence "public"."products_id_seq" as integer increment by 1 minvalue 1 maxvalue 2147483647 START with 1 cache 1 no cycle;
create sequence "public"."sales_id_seq" as integer increment by 1 minvalue 1 maxvalue 2147483647 START with 1 cache 1 no cycle;
create table "public"."customers" (
  "id"    integer not null default nextval('public.customers_id_seq'::regclass),
  "name"  text    not null,
  "email" text    not null,
  "city"  text    not null,
  constraint "customers_pkey" primary key (id)
);
create table "public"."products" (
  "id"       integer not null default nextval('public.products_id_seq'::regclass),
  "name"     text    not null,
  "category" text    not null,
  "price"    numeric not null,
  constraint "products_pkey" primary key (id)
);
create table "public"."sales" (
  "id"          integer not null default nextval('public.sales_id_seq'::regclass),
  "product_id"  integer,
  "customer_id" integer,
  "quantity"    integer not null,
  "sale_date"   date    default CURRENT_DATE,
  constraint "sales_pkey" primary key (id)
);
alter sequence "public"."customers_id_seq" owned by "public"."customers"."id";
alter sequence "public"."products_id_seq" owned by "public"."products"."id";
alter sequence "public"."sales_id_seq" owned by "public"."sales"."id";
alter table "public"."sales"
  add constraint "sales_customer_id_fkey" foreign key (customer_id) references public.customers(id);
alter table "public"."sales"
  add constraint "sales_product_id_fkey" foreign key (product_id) references public.products(id);
grant update on sequence "public"."customers_id_seq" to "anon", "authenticated";
grant select, update, usage on sequence "public"."customers_id_seq" to "postgres";
grant update on sequence "public"."customers_id_seq" to "service_role";
grant update on sequence "public"."products_id_seq" to "anon", "authenticated";
grant select, update, usage on sequence "public"."products_id_seq" to "postgres";
grant update on sequence "public"."products_id_seq" to "service_role";
grant update on sequence "public"."sales_id_seq" to "anon", "authenticated";
grant select, update, usage on sequence "public"."sales_id_seq" to "postgres";
grant update on sequence "public"."sales_id_seq" to "service_role";
grant maintain, references, trigger, truncate on table "public"."customers" to "anon", "authenticated";
grant delete, insert, maintain, references, select, trigger, truncate, update on table "public"."customers" to "postgres";
grant maintain, references, trigger, truncate on table "public"."customers" to "service_role";
grant maintain, references, trigger, truncate on table "public"."products" to "anon", "authenticated";
grant delete, insert, maintain, references, select, trigger, truncate, update on table "public"."products" to "postgres";
grant maintain, references, trigger, truncate on table "public"."products" to "service_role";
grant maintain, references, trigger, truncate on table "public"."sales" to "anon", "authenticated";
grant delete, insert, maintain, references, select, trigger, truncate, update on table "public"."sales" to "postgres";
grant maintain, references, trigger, truncate on table "public"."sales" to "service_role";

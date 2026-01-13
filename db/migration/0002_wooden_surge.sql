CREATE TABLE "survey_category" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar NOT NULL,
	"description" text,
	CONSTRAINT "survey_category_name_unique" UNIQUE("name")
);
--> statement-breakpoint
ALTER TABLE "survey" ADD COLUMN "category_id" integer;
--> statement-breakpoint
ALTER TABLE "survey" ADD COLUMN "tags" jsonb DEFAULT '[]'::jsonb;
--> statement-breakpoint
ALTER TABLE "survey" ADD CONSTRAINT "survey_category_id_survey_category_id_fk" FOREIGN KEY ("category_id") REFERENCES "public"."survey_category"("id") ON DELETE set null ON UPDATE no action;
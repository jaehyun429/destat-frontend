CREATE TABLE "comment" (
	"id" serial PRIMARY KEY NOT NULL,
	"survey_id" varchar NOT NULL,
	"sender" varchar NOT NULL,
	"message" text NOT NULL,
	"created_at" timestamp DEFAULT now()
);
--> statement-breakpoint
ALTER TABLE "comment" ADD CONSTRAINT "comment_survey_id_survey_id_fk" FOREIGN KEY ("survey_id") REFERENCES "public"."survey"("id") ON DELETE cascade ON UPDATE no action;
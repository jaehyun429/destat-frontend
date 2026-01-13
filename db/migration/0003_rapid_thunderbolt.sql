CREATE TABLE "survey_statistics" (
	"id" serial PRIMARY KEY NOT NULL,
	"survey_id" varchar NOT NULL,
	"total_responses" integer DEFAULT 0,
	"completion_rate" double precision DEFAULT 0,
	"average_time_spent" integer DEFAULT 0,
	"last_updated" timestamp DEFAULT now(),
	CONSTRAINT "survey_statistics_survey_id_unique" UNIQUE("survey_id")
);
--> statement-breakpoint
ALTER TABLE "survey" ADD COLUMN "status" varchar DEFAULT 'active';
--> statement-breakpoint
ALTER TABLE "survey" ADD COLUMN "start_date" timestamp DEFAULT now();
--> statement-breakpoint
ALTER TABLE "survey" ADD COLUMN "end_date" timestamp;
--> statement-breakpoint
ALTER TABLE "survey_statistics" ADD CONSTRAINT "survey_statistics_survey_id_survey_id_fk" FOREIGN KEY ("survey_id") REFERENCES "public"."survey"("id") ON DELETE cascade ON UPDATE no action;
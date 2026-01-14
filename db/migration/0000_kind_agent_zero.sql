CREATE TABLE "daily_live_survey" (
	"id" serial PRIMARY KEY NOT NULL,
	"count" bigint DEFAULT 0,
	"created_at" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE "daily_visitor" (
	"id" serial PRIMARY KEY NOT NULL,
	"count" bigint DEFAULT 0,
	"day_start" timestamp NOT NULL,
	CONSTRAINT "daily_visitor_day_start_unique" UNIQUE("day_start")
);
--> statement-breakpoint
CREATE TABLE "answer" (
	"id" serial PRIMARY KEY NOT NULL,
	"answers" jsonb DEFAULT '{}'::jsonb,
	"survey_id" varchar,
	"created_at" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE "survey" (
	"id" varchar PRIMARY KEY NOT NULL,
	"title" varchar NOT NULL,
	"description" text NOT NULL,
	"target_number" integer NOT NULL,
	"reward_amount" double precision NOT NULL,
	"questions" jsonb NOT NULL,
	"owner" varchar NOT NULL,
	"image" text NOT NULL,
	"finish" boolean DEFAULT false,
	"view" bigint DEFAULT 0,
	"created_at" timestamp DEFAULT now()
);
--> statement-breakpoint
ALTER TABLE "answer" ADD CONSTRAINT "answer_survey_id_survey_id_fk" FOREIGN KEY ("survey_id") REFERENCES "public"."survey"("id") ON DELETE no action ON UPDATE no action;
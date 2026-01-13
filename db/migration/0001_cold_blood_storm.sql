CREATE TABLE "user" (
	"wallet_address" varchar PRIMARY KEY NOT NULL,
	"username" varchar,
	"profile_image" text,
	"created_at" timestamp DEFAULT now(),
	"last_login" timestamp DEFAULT now()
);
--> statement-breakpoint
ALTER TABLE "answer" ADD COLUMN "respondent" varchar;
--> statement-breakpoint
ALTER TABLE "answer" ADD CONSTRAINT "answer_respondent_user_wallet_address_fk" FOREIGN KEY ("respondent") REFERENCES "public"."user"("wallet_address") ON DELETE no action ON UPDATE no action;